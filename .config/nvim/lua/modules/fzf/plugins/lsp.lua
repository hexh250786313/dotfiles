local api = vim.api
local fn = vim.fn
local fzf_lua = require("fzf-lua")
local builtin = require("fzf-lua.previewer.builtin")
local wk = require("which-key")
local utils = require "fzf-lua.utils"
local CocAction = fn.CocAction
local LspPreviewer = builtin.base:extend()

local store = { results = {}, items = {} }

-- 初始化自定义 previewer
function LspPreviewer:new(o, opts, fzf_win)
  LspPreviewer.super.new(self, o, opts, fzf_win)
  setmetatable(self, LspPreviewer)
  return self
end

-- 组合字符串
local function format_string(filename, lnum, col, text)
  return string.format("%s | %d col %d | %s", filename, lnum, col, text)
end

-- 分解字符串
local function parse_string(formatted_string)
  local pattern = "(.+) | (%d+) col (%d+) | (.+)"
  local extracted_filename, extracted_lnum, extracted_col, extracted_text = string.match(formatted_string, pattern)
  return extracted_filename, tonumber(extracted_lnum), tonumber(extracted_col), extracted_text
end
-- 检查 coc 是否已经初始化
local function is_ready(feature)
  if vim.g.coc_service_initialized ~= 1 then
    print('Coc is not ready!')
    return
  end

  if feature and not fn.CocHasProvider(feature) then
    print('Coc: server does not support ' .. feature)
    return
  end

  return true
end

-- 获取移除 cwd 的 filename
local function get_filename(path)
  local cwd = vim.fn.getcwd()
  if not string.match(cwd, "/$") then
    cwd = cwd .. "/"
  end
  -- 转义
  cwd = string.gsub(cwd, "([%.%-%+])", "%%%1")
  return string.gsub(path, "^" .. cwd, "")
end

-- 从 store 中获取对应的结果
local function get_target_store(str)
  -- 从 store.items 找到对应的结果，记录目标 index
  local index = -1
  for i, item in ipairs(store.items) do
    if item.display == str then
      index = i
      break
    end
  end

  local res = {}

  res.source = store.source[index]
  res.item = store.items[index]

  return res
end

-- 把 locations 转换成 items
local locations_to_items = function(locs)
  if not locs then
    return
  end
  local items = {}
  for _, l in ipairs(locs) do
    if l.targetUri and l.targetRange then
      -- LocationLink
      l.uri = l.targetUri
      l.range = l.targetRange
    end
    local bufnr = vim.uri_to_bufnr(l.uri)
    local was_buffer_previously_opend = api.nvim_buf_is_loaded(bufnr)
    local line = ''

    if not was_buffer_previously_opend then
      -- 没有打开过 buffer，使用 vim.fn.readfile 读取文件内容
      local content = vim.fn.readfile(vim.uri_to_fname(l.uri))
      line = content[l.range.start.line + 1]
    else
      -- 已有 buffer，使用 api.nvim_buf_get_lines 读取文件内容
      line = (api.nvim_buf_get_lines(bufnr, l.range.start.line, l.range.start.line + 1, false) or { '' })[1]
    end

    local filename = vim.uri_to_fname(l.uri)
    local row = l.range.start.line
    items[#items + 1] = { filename = filename, lnum = row + 1, col = l.range.start.character + 1, text = line }
  end

  return items
end

-- 重写 previewer 的 populate_preview_buf 方法
function LspPreviewer:populate_preview_buf(display_str)
  local tmpbuf = self:get_tmp_buffer()

  local _, lnum, col = parse_string(display_str)

  local target = get_target_store(display_str)
  local uri = target.source.uri

  -- 先查询 buffer 是否已经打开，如果已经打开，读取 buffer 的内容
  -- 否则，使用 vim.fn.readfile 读取文件内容
  local content = {}
  local filetype = ''

  local bufnr = vim.uri_to_bufnr(uri)
  local was_buffer_previously_opend = api.nvim_buf_is_loaded(bufnr)
  vim.fn.bufload(bufnr)

  -- 打开 buffer，获取内容和 filetype，如果 buffer 已经打开，不会重复打开
  -- 获取完毕后，如果之前未打开，关闭 buffer
  content = api.nvim_buf_get_lines(bufnr, 0, -1, false)
  filetype = api.nvim_buf_get_option(bufnr, 'filetype')
  if not was_buffer_previously_opend then
    api.nvim_buf_delete(bufnr, { force = true })
  end

  local range = target.source.range

  -- 设置内容
  vim.api.nvim_buf_set_lines(tmpbuf, 0, -1, false, content)
  -- 设置 filetype
  vim.api.nvim_buf_set_option(tmpbuf, 'filetype', filetype)
  self:set_preview_buf(tmpbuf)

  -- 设置高亮和光标位置
  pcall(api.nvim_win_call, self.win.preview_winid, function()
    -- 这个回调中 0 就是当前窗口的 编号：
    -- 相当于 local winnr = vim.fn.bufwinid(tmpbuf) 的 winnr
    api.nvim_win_set_cursor(0, { lnum, col - 1 })
    fn.clearmatches()
    -- 高亮 range
    vim.api.nvim_buf_add_highlight(tmpbuf, -1, 'LspReferenceText', range.start.line, range.start.character,
                                   range['end'].character)
    self.orig_pos = api.nvim_win_get_cursor(0) -- 给 LspPreviewer:scroll() 用的原始光标位置，用于判断是否需要设置 cursorline
    utils.zz()
  end)

  self.win:update_scrollbar(true)
end

-- 选中后跳转到对应的位置
local function jump_to_location(selected)
  utils.fzf_exit()
  local display_str = selected[1]
  local target = get_target_store(display_str)

  vim.lsp.util.jump_to_location(target.source)
  store = {}
end

-- to quickfix
local function send_selected_to_qf(selected, opts)
  local all_items = {}
  -- 如果 selected 长度只有一个，则打开全部
  if selected and #selected ~= 1 then
    for _, str in ipairs(selected) do
      local target = get_target_store(str)
      all_items[#all_items + 1] = target.item
    end
  else
    all_items = store.items
  end
  local qf_list = {}
  local lsp_ranges = {}
  local title = string.format("[FzfLua] lsp references")

  for _, item in ipairs(all_items) do
    local target = get_target_store(item.display)
    local source = target.source
    print(vim.inspect(source))
    table.insert(qf_list, { filename = get_filename(item.filename), lnum = item.lnum, col = item.col, text = item.text })
    table.insert(lsp_ranges, source.range)
  end

  vim.fn.setqflist({}, " ",
                   { nr = "$", items = qf_list, title = title, context = { bqf = { lsp_ranges_hl = lsp_ranges } } })
  if type(opts.copen) == "function" then
    opts.copen(selected, opts)
  elseif opts.copen ~= false then
    vim.cmd(opts.copen or "botright copen")
  end

  store = {}
end

-- lsp_reference
local function lsp_reference()
  store = {}
  if not is_ready('reference') then
    return
  end

  local refs = CocAction('references', false)
  if type(refs) ~= 'table' or vim.tbl_isempty(refs) then
    return
  end

  store.source = refs;

  local results = locations_to_items(refs);

  if not results or vim.tbl_isempty(results) then
    return
  end

  local strings = {}

  for _, result in ipairs(results) do
    local filename = get_filename(result.filename)

    local str = format_string(filename, result.lnum, result.col, result.text)
    strings[#strings + 1] = str

    result.display = str
  end

  store.items = results;

  fzf_lua.fzf_exec(strings, {
    previewer = LspPreviewer,
    actions = { ['enter'] = jump_to_location, ['ctrl-q'] = send_selected_to_qf },
  })
end

wk.register({ mode = { "n" }, ["gr"] = { lsp_reference, "Go to references" } })
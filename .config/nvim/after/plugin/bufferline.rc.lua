local Path = require("plenary.path")
local fn = vim.fn
local api = vim.api
local utils = require("telescope.utils")

local function max_split(s, pattern, maxsplit)
  pattern = pattern or " "
  maxsplit = maxsplit or -1

  local t = {}

  local curpos = 0
  while maxsplit ~= 0 and curpos < #s do
    local found, final = string.find(s, pattern, curpos, false)
    if found ~= nil then
      local val = string.sub(s, curpos, found - 1)

      if #val > 0 then
        maxsplit = maxsplit - 1
        table.insert(t, val)
      end

      curpos = final + 1
    else
      -- curpos = curpos + 1
      table.insert(t, string.sub(s, curpos))
      break
    end

    if maxsplit == 0 then
      table.insert(t, string.sub(s, curpos))
    end
  end

  return t
end

local function is_coc_ready(feature)
  if vim.g.coc_service_initialized ~= 1 then
    print("Coc is not ready!")
    return
  end

  if feature and not fn.CocHasProvider(feature) then
    print("Coc: server does not support " .. feature)
    return
  end

  return true
end

require("bufferline").setup {
  options = {
    -- separator_style = "padded_slant",
    -- separator_style = {"░", "░"},
    -- separator_style = {">", "<"},
    -- separator_style = {"", ""},
    -- separator_style = {"  ", "  "},
    -- separator_style = {"░▓", "▓░"},
    -- diagnostics = "coc",
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    -- local icon = level:match("error") and " " or " "
    -- return " " .. icon .. count
    -- end,
    -- indicator_icon = " ",
    custom_filter = function(buf_number, buf_numbers)
      -- return true
      -- 当前 buffer 返回 true
      if vim.fn.bufname(buf_number) == vim.fn.expand("%") then
        return true
      end
      -- print(vim.fn.expand('%'))
      -- print(vim.fn.bufname(buf_number) == vim.fn.expand('%:p'))
      -- print(vim.fn.bufname(buf_number))
      -- filter out filetypes you don't want to see
      -- if vim.bo[buf_number].filetype == "qqk" then
      -- return true
      -- end
      -- -- filter out by buffer name:p
      -- if vim.fn.bufname(buf_number) == "qqk" then
      -- return true
      -- end
      -- local qq = vim.b.coc_git_status
      -- print(qq);
      -- local result = vim.fn.systemlist("git diff-tree --no-commit-id --name-only -r HEAD")
      -- for k, v in pairs(result) do
      -- result[k] = "  " .. result[k]
      -- print(result[k])
      -- end
      -- api.nvim_buf_set_lines(buf, 0, -1, false, result)
      -- local pipe = io.popen('git status --porcelain -uall')
      -- vim.defer_fn(function()
      -- pipe:flush()
      -- pipe:close()
      -- end, 1000)
      if not is_coc_ready() then
        return false
      end
      local home = vim.call("coc#util#get_data_home")
      local data = Path:new(home .. Path.path.sep .. "mru"):read()
      local results = {}
      if not data or #data == 0 then
        return
      end
      local cwd = vim.loop.cwd() .. Path.path.sep
      for index, val in ipairs(max_split(data, "\n")) do
        if index > 5 then
          return
        end
        local p = Path:new(val)
        local lowerPrefix = val:sub(1, #cwd):gsub(Path.path.sep, ""):lower()
        local lowerCWD = cwd:gsub(Path.path.sep, ""):lower()
        if lowerCWD == lowerPrefix and p:exists() and p:is_file() then
          if vim.fn.bufname(buf_number) == val:sub(#cwd + 1) then
            return true
          end
        end
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      -- if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
      -- return true
      -- end
      -- filter out by it's index number in list (don't show first buffer)
      -- if buf_numbers[1] ~= buf_number then
      -- return true
      -- end
    end
  }
  -- highlights = {
  -- fill = {
  -- guibg = "#282828"
  -- },
  -- background = {
  -- guifg = "#ffffff",
  -- guibg = "#373737"
  -- },
  -- tab = {
  -- guifg = "#ffffff",
  -- guibg = "#373737"
  -- },
  -- tab_selected = {
  -- guifg = "#ffffff",
  -- guibg = "#0a7aca"
  -- },
  -- tab_close = {
  -- guifg = "#ffffff",
  -- guibg = "#282828"
  -- },
  -- close_button = {
  -- guifg = "#ffffff",
  -- guibg = "#373737"
  -- },
  -- -- close_button_visible = {
  -- -- guifg = "#ffffff",
  -- -- guibg = "#373737"
  -- -- },
  -- close_button_selected = {
  -- guifg = "#ffffff",
  -- guibg = "#0a7aca"
  -- },
  -- -- buffer_visible = {
  -- -- guifg = "#ffffff",
  -- -- guibg = "#0a7aca"
  -- -- },
  -- buffer_selected = {
  -- guifg = "#ffffff",
  -- guibg = "#0a7aca",
  -- gui = "bold,italic"
  -- },
  -- -- diagnostic = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- diagnostic_visible = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- diagnostic_selected = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>",
  -- -- gui = "bold,italic"
  -- -- },
  -- -- info = {
  -- -- -- guifg = "<color-value-here>",
  -- -- -- guisp = "<color-value-here>",
  -- -- -- guibg = "<color-value-here>"
  -- -- guifg = "#ffffff",
  -- -- guibg = "#0a7aca",
  -- -- guisp = "#0a7aca",
  -- -- },
  -- -- info_visible = {
  -- -- guifg = "#ffffff",
  -- -- guibg = "#0a7aca",
  -- -- },
  -- -- info_selected = {
  -- -- -- guifg = "<color-value-here>",
  -- -- -- guibg = "<color-value-here>",
  -- -- gui = "bold,italic",
  -- -- guisp = "#0a7aca",
  -- -- guifg = "#ffffff",
  -- -- guibg = "#0a7aca"
  -- -- }
  -- -- info_diagnostic = {
  -- -- guifg = "<color-value-here>",
  -- -- guisp = "<color-value-here>",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- info_diagnostic_visible = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- info_diagnostic_selected = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>",
  -- -- gui = "bold,italic",
  -- -- guisp = "<color-value-here>"
  -- -- },
  -- -- warning = {
  -- -- guifg = "<color-value-here>",
  -- -- guisp = "<color-value-here>",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- warning_visible = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- warning_selected = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>",
  -- -- gui = "bold,italic",
  -- -- guisp = "<color-value-here>"
  -- -- },
  -- -- warning_diagnostic = {
  -- -- guifg = "<color-value-here>",
  -- -- guisp = "<color-value-here>",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- warning_diagnostic_visible = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- warning_diagnostic_selected = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>",
  -- -- gui = "bold,italic",
  -- -- guisp = warning_diagnostic_fg
  -- -- },
  -- -- error = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>",
  -- -- guisp = "<color-value-here>"
  -- -- },
  -- -- error_visible = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- error_selected = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>",
  -- -- gui = "bold,italic",
  -- -- guisp = "<color-value-here>"
  -- -- },
  -- -- error_diagnostic = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>",
  -- -- guisp = "<color-value-here>"
  -- -- },
  -- -- error_diagnostic_visible = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- error_diagnostic_selected = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>",
  -- -- gui = "bold,italic",
  -- -- guisp = "<color-value-here>"
  -- -- },
  -- modified = {
  -- guifg = "#ffffff",
  -- guibg = "#373737"
  -- },
  -- -- modified_visible = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- modified_selected = {
  -- guifg = "#ffffff",
  -- guibg = "#0a7aca"
  -- },
  -- -- duplicate_selected = {
  -- -- guifg = "<color-value-here>",
  -- -- gui = "italic",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- duplicate_visible = {
  -- -- guifg = "<color-value-here>",
  -- -- gui = "italic",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- duplicate = {
  -- -- guifg = "<color-value-here>",
  -- -- gui = "italic",
  -- -- guibg = "<color-value-here>"
  -- -- },
  -- -- separator_visible = {
  -- -- guifg = "#ffffff",
  -- -- guibg = "#ffffff"
  -- -- },
  -- -- separator = {
  -- -- guifg = "#ffffff",
  -- -- guibg = "#f951a8"
  -- -- },
  -- separator = {
  -- guifg = "#ffffff",
  -- guibg = "#0a7aca"
  -- },
  -- separator_selected = {
  -- guifg = "#0a7aca",
  -- guibg = "#ffffff"
  -- },
  -- indicator_selected = {
  -- guifg = "#0a7aca",
  -- guibg = "#0a7aca"
  -- }
  -- -- separator_selected = {
  -- -- guifg = "#282828"
  -- -- },
  -- -- separator_visible = {
  -- -- guifg = "#282828"
  -- -- },
  -- -- separator = {
  -- -- guifg = "#282828"
  -- -- }
  -- -- pick_selected = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>",
  -- -- gui = "bold,italic"
  -- -- },
  -- -- pick_visible = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>",
  -- -- gui = "bold,italic"
  -- -- },
  -- -- pick = {
  -- -- guifg = "<color-value-here>",
  -- -- guibg = "<color-value-here>",
  -- -- gui = "bold,italic"
  -- -- }
  -- }
}

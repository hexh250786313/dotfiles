---------> 配置
-- 除了 autocmd 处对大文件进行处理, 这里也不能省略
local disabler = function(lang, bufnr)
  -- 检查文件大小
  local max_filesize = 500 * 1024 -- 500K
  local lcount = vim.api.nvim_buf_line_count(bufnr)
  local bytes = vim.api.nvim_buf_get_offset(bufnr, lcount)
  -- stats.size 的值等于 bytes，但是 nvim_buf_get_offset 看起来语法漂亮点
  -- local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
  if bytes > max_filesize then
    return true
  end

  -- 检查是否存在长行
  local max_line_length = 1000 -- 设置单行最大长度为1000字符
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  for _, line in ipairs(lines) do
    if #line > max_line_length then
      return true
    end
  end

  return false
end

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "javascript",
    "typescript",
    "css",
    "scss",
    "vue",
    "lua",
    "vim",
    "tsx",
    "markdown",
    "html",
    "markdown_inline",
    "svelte",
    "go",
    "rust",
    "vimdoc",
  },
  auto_install = false,
  highlight = { enable = true, disable = disabler },
  incremental_selection = { enable = false, disable = disabler },
  textobjects = {
    select = {
      enable = false,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      selection_modes = { ["@parameter.outer"] = "v", ["@function.outer"] = "V", ["@class.outer"] = "<c-v>" },
      include_surrounding_whitespace = true,
    },
  },
})

-- 创建自动命令组
local augroup = vim.api.nvim_create_augroup("LargeFileCheck", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  callback = function()
    local max_line_length = 1000
    local max_filesize = 500 * 1024 -- 500K
    local bufnr = vim.api.nvim_get_current_buf()

    -- 检查文件大小
    -- local file_size = vim.fn.line2byte(vim.fn.line("$")) + vim.fn.len(vim.fn.getline("$"))
    -- if file_size > 512000 then
    --   vim.cmd("syntax clear")
    --   -- vim.cmd("setlocal nowrap")
    --   return
    -- end
    local lcount = vim.api.nvim_buf_line_count(bufnr)
    local bytes = vim.api.nvim_buf_get_offset(bufnr, lcount)
    if bytes > max_filesize then
      vim.cmd("syntax clear")
    end

    -- 检查是否存在长行
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for _, line in ipairs(lines) do
      if #line > max_line_length then
        vim.cmd("syntax clear")
        -- vim.cmd("setlocal nowrap")
        return
      end
    end
  end,
})

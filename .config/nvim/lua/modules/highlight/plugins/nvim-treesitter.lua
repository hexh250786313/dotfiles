---------> 配置
-- 除了 autocmd 处对大文件进行处理, 这里也不能省略
local disabler = function(lang, bufnr)
  local max_filesize = 50 * 1024 -- 50 KB
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
  if ok and stats and stats.size > max_filesize then
    return true
  end
  return false
end

require("nvim-treesitter.configs").setup {
  ensure_installed = { "javascript", "typescript", "css", "scss", "vue", "lua", "vim", "tsx", "markdown" },
  auto_install = false,
  highlight = { enable = false, disable = disabler },
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
      selection_modes = { ['@parameter.outer'] = 'v', ['@function.outer'] = 'V', ['@class.outer'] = '<c-v>' },
      include_surrounding_whitespace = true,
    },
  },
}

vim.cmd([[
" 约 50K
autocmd BufEnter * if line2byte('$') + len(getline('$')) > 51200 | syntax clear | setlocal nowrap | endif
]])

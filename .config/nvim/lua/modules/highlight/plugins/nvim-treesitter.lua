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
  ensure_installed = {"javascript", "typescript", "css", "scss", "vue", "lua", "vim", "tsx", "markdown"},
  auto_install = false,
  highlight = {
    enable = true,
    -- enable = false,
    disable = disabler
  },
  incremental_selection = {
    enable = false,
    disable = disabler
  }
}

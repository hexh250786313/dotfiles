require "diffview".setup {
  file_history_panel = {
    win_config = {
      height = 9
    }
  }
}

vim.cmd(
  [[
nnoremap <silent> <Space>gt :DiffviewFileHistory %<CR>
nnoremap <silent> <Space>gT :DiffviewFileHistory<CR>
nnoremap <silent> <Space>gg :DiffviewOpen<CR>
]]
)

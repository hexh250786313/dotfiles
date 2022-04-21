require "diffview".setup {
  file_history_panel = {
    height = 1
  }
}

vim.cmd([[
nnoremap <silent> <Space>gt :DiffviewFileHistory<CR>
nnoremap <silent> <Space>gG :DiffviewOpen<CR>
]])

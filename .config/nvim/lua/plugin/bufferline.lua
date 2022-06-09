require("bufferline").setup {
  options = {
    separator_style = {"", ""},
    indicator_icon = "▌",
    max_prefix_length = 100,
    -- modified_icon = "",
    modified_icon = ""
  }
}

vim.cmd(
  [[
function DeleteAllBuffers ()
  " :BufferLineCloseLeft
  " :BufferLineCloseRight
  :%bd
  :e#
  :bd#
endfunction

nnoremap <silent> <Space>bD :call DeleteAllBuffers()<CR>
nnoremap <silent> <Space>1 :BufferLineGoToBuffer 1<cr>
nnoremap <silent> <Space>2 :BufferLineGoToBuffer 2<cr>
nnoremap <silent> <Space>3 :BufferLineGoToBuffer 3<cr>
nnoremap <silent> <Space>4 :BufferLineGoToBuffer 4<cr>
nnoremap <silent> <Space>5 :BufferLineGoToBuffer 5<cr>
nnoremap <silent> <Space>6 :BufferLineGoToBuffer 6<cr>
nnoremap <silent> gb :BufferLineCycleNext<cr>
nnoremap <silent> gB :BufferLineCyclePrev<cr>
nnoremap <silent> <space>bs :BufferLineSortByDirectory<cr>
nnoremap <silent> <space>bp :BufferLinePick<cr>
nnoremap <silent> <space>bp :BufferLinePick<cr>
nnoremap <silent> <space>b> :BufferLineMoveNext<cr>
nnoremap <silent> <space>b< :BufferLineMovePrev<cr>
]]
)

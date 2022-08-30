vim.g.fugitive_pty = 0

vim.cmd(
  [[
function! ToggleGStatus()
  if buflisted(bufname('.git//'))
    bd .git//
  else
    Git
  endif
endfunction

nnoremap <silent> <Space>gc :Git commit<CR>
" nnoremap <silent> <Space>gg :Git<CR>
nnoremap <silent> <Space>gg :<C-u>call ToggleGStatus()<cr>
]]
)

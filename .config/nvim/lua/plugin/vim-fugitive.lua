vim.g.fugitive_pty = 0

vim.cmd([[
function DisabaleFocusAndGit ()
  :FocusDisable
  :Git
endfunction
nnoremap <silent> <Space>gg :call DisabaleFocusAndGit()<CR>
nnoremap <silent> <Space>gc :Git commit<CR>
]])


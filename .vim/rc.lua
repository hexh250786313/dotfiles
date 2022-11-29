vim.cmd(
  [[
" let g:defx_win_width = 64
let g:defx_win_width = 40

if match(&runtimepath, 'Defx') != -1
  call defx#custom#column('filename', {
    \   'min_width': g:defx_win_width - 2,
    \ })
  call defx#custom#option('_', {
    \   'show_ignored_files': 0,
    \   'winwidth': g:defx_win_width,
    \   'ignored_files': '.git,.vim',
    \ })
endif
]]
)

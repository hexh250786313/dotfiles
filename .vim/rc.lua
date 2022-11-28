vim.cmd(
  [[
if match(&runtimepath, 'Defx') != -1
  call defx#custom#column('filename', {
    \   'min_width': 38,
    \ })
  call defx#custom#option('_', {
    \   'show_ignored_files': 0,
    \   'winwidth': 40,
    \   'ignored_files': '.git,.vim',
    \ })
endif
]]
)

vim.cmd(
  [[
if match(&runtimepath, 'Defx') != -1
  call defx#custom#option('_', {
    \   'show_ignored_files': 0,
    \   'ignored_files': '.git',
    \ })
endif
]]
)

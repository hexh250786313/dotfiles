vim.cmd(
  [[
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '/**', 'rightAlt': '*/' },
	\ 'javascriptreact': { 'left': '//', 'right': '', 'leftAlt': '/**', 'rightAlt': '*/' },
	\ 'typescript': { 'left': '//', 'right': '', 'leftAlt': '/**', 'rightAlt': '*/' },
	\ 'typescriptreact': { 'left': '//', 'right': '', 'leftAlt': '/**', 'rightAlt': '*/' },
\}

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

nmap <silent> <Space>cl <Plug>NERDCommenterToggle
nmap <silent> <Space>cy <Plug>NERDCommenterYank
nmap <silent> <Space>cs <Plug>NERDCommenterSexy
nmap <silent> <Space>cu <Plug>NERDCommenterUncomment

vmap <silent> <Space>cl <Plug>NERDCommenterToggle
vmap <silent> <Space>cy <Plug>NERDCommenterYank
vmap <silent> <Space>cs <Plug>NERDCommenterSexy
vmap <silent> <Space>cu <Plug>NERDCommenterUncomment
]]
)

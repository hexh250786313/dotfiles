vim.cmd(
  [[
noremap <Space>y "+y
noremap <Space>p "+p
noremap <Space>o "+x
noremap <C-c>y "+y
noremap <C-v> "+p

nnoremap <silent> <C-s> :silent write<CR>
nnoremap <silent> <Space>wq :q<CR>
nnoremap <silent> <Space>wV :vsplit<CR>
nnoremap <silent> <Space>wS :split<CR>
nnoremap <silent> <Space>wj <C-w>j
nnoremap <silent> <Space>wh <C-w>h
nnoremap <silent> <Space>wk <C-w>k
nnoremap <silent> <Space>wl <C-w>l
nnoremap <silent> <Space>wJ <C-w>J
nnoremap <silent> <Space>wH <C-w>H
nnoremap <silent> <Space>wK <C-w>K
nnoremap <silent> <Space>wL <C-w>L
nnoremap <silent> <Space>wd :q<CR>

nnoremap <silent> <Space>qq :qa<CR>
nnoremap <silent> <Space>qt :tabclose<CR>

nnoremap <Space><tab> <C-^>

xnoremap > >gv|
xnoremap < <gv
nnoremap > >>_
nnoremap < <<_

nnoremap <silent> <C-r> :silent redo<CR>
nnoremap <silent> u :silent undo<CR>

nnoremap <silent> <Space>sq :copen<cr>

nmap <Space>wt <C-w>v<C-w>T

nnoremap <silent> <space>hn <cmd>call ToggleBackground()<cr>
]]
)

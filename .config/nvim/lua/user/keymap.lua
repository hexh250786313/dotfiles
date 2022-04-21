vim.cmd(
  [[
noremap <Space>y "+y
noremap <Space>p "+p
noremap <Space>o "+x
noremap <C-c>y "+y
noremap <C-v> "+p

nnoremap <silent> <Space>bd :bd<CR>

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
nnoremap <silent> <Space>ww <C-w>w
nnoremap <silent> <Space>wW <C-w>W

nnoremap <silent> <Space>qq :qa<CR>
nnoremap <silent> <Space>qt :tabclose<CR>

nnoremap <Space><tab> <C-^>

xnoremap > >gv|
xnoremap < <gv
nnoremap > >>_
nnoremap < <<_

nnoremap <silent> <C-r> :silent redo<CR>
nnoremap <silent> u :silent undo<CR>

nnoremap <silent> <Space>sq <cmd>botright copen<cr>

nmap <Space>wt <C-w>v<C-w>T

" 特殊 keymap, 如果需要按需加载的插件, 加载前是不会读 config 的内容的
" 所以放到 config 无效, 只能在这里加载

" vim-fugitive.lua
nnoremap <silent> <Space>gG :Git<CR>
nnoremap <silent> <Space>gc :Git commit<CR>

" differview.lua
nnoremap <silent> <Space>gt :DiffviewFileHistory<CR>
nnoremap <silent> <Space>gg :DiffviewOpen<CR>

" formatter.lua
nnoremap <silent> <Space>bf :Format<cr>
xnoremap <silent> <Space>bf :Format<cr>

" hop.lua
nmap f <cmd>:HopChar1<CR>
vmap f <cmd>:HopChar1<CR>

]]
)

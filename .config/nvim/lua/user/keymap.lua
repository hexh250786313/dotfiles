vim.keymap.set({"n", "x"}, "<ScrollWheelUp>", "3<c-y>")
vim.keymap.set({"n", "x"}, "<ScrollWheelDown>", "3<c-e>")
vim.keymap.set({"i"}, "<ScrollWheelUp>", "<c-x><c-y><c-x><c-y><c-x><c-y>")
vim.keymap.set({"i"}, "<ScrollWheelDown>", "<c-x><c-e><c-x><c-e><c-x><c-e>")
-- vim.keymap.set("n", "<Up>", "3<C-y>")
-- vim.keymap.set("n", "<Down>", "3<C-e>")
-- vim.keymap.set('i', '<ScrollWheelUp>', '<C-y>')
-- vim.keymap.set('i', '<ScrollWheelDown>', '<C-e>')
-- vim.keymap.set('v', '<ScrollWheelUp>', '<C-y>')
-- vim.keymap.set('v', '<ScrollWheelDown>', '<C-e>')

vim.keymap.set({"n"}, "<c-z>", "u")
vim.keymap.set({"i"}, "<c-z>", "<c-o>u")

vim.cmd(
  [[
" vnoremap p "+p
" vnoremap P "+P
" vnoremap y "+y
vnoremap <silent> x "+d
nnoremap <silent> x v"+d
vnoremap <silent> <c-x> "+d
nnoremap <silent> <c-x> v"+d
" vnoremap <silent> d "0d
" vnoremap <silent> s "+s
nnoremap <silent> yy "+yy
nnoremap <silent> dd "+dd
" noremap <Space>y "+y
" noremap <silent> <Space>y :<C-u>call ClipboardYank(visualmode())<cr>
" noremap <Space>p "+p
" noremap <Space>o "+x
" vnoremap <Space>y "+y
" vnoremap <silent> <C-c> :<C-u>call ClipboardYank(visualmode())<cr>
" noremap <C-c>y "+y
" noremap <C-v> "+p
set pastetoggle=<F10>
nnoremap <C-v> "+p
xnoremap <C-v> "+p
inoremap <C-v> <F10><C-r>+<F10>
" inoremap <C-v> "+p

nmap <S-Down> <C-d>
nmap <S-Up> <C-u>

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
nnoremap <silent> <Space>wD :only<CR>

nnoremap <silent> <Space>qq :qa<CR>
nnoremap <silent> <Space>qt :tabclose<CR>

nnoremap <Space><tab> <C-^>

" xnoremap > >gv|
" xnoremap < <gv
" nnoremap > >>_
" nnoremap < <<_

" 缩进一格
" xnoremap > :s/^/ /<CR>:noh<CR>gv
" xnoremap < :s/^\s\=//<CR>:noh<CR>gv
xnoremap > :call Indent('>')<CR>gv
xnoremap < :call Indent('<')<CR>gv
nnoremap > :s/^/ /<CR>:noh<CR>
nnoremap < :s/^\s\=//<CR>:noh<CR>

nnoremap <silent> <C-r> :silent redo<CR>
nnoremap <silent> u :silent undo<CR>

nnoremap <silent> <Space>sq :copen<cr>

nmap <Space>wt <C-w>v<C-w>T

nnoremap <silent> <space>hn <cmd>call ToggleNormalBackground()<cr>
nnoremap <silent> <space>hc <cmd>call ToggleCursorLine()<cr>
nnoremap <silent> <space>sc <cmd>call CloseSQAndSG()<cr>
nnoremap <silent> <Space>bD :call DeleteAllBuffers()<CR>

xnoremap a' 2i'
xnoremap a" 2i"
xnoremap a` 2i`

inoremap <c-a> <Home>
inoremap <c-e> <End>
cnoremap <c-a> <Home>
cnoremap <c-e> <End>

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

nnoremap <silent><nowait> <left> 3zh
nnoremap <silent><nowait> <right> 3zl

" nnoremap J gJ
xnoremap J gJ

nnoremap <c-z> u
]]
)

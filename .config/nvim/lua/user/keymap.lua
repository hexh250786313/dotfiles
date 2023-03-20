vim.keymap.set({"n", "x"}, "<ScrollWheelUp>", "3<c-y>")
vim.keymap.set({"n", "x"}, "<ScrollWheelDown>", "3<c-e>")
vim.keymap.set({"i"}, "<ScrollWheelUp>", "<c-x><c-y><c-x><c-y><c-x><c-y>")
vim.keymap.set({"i"}, "<ScrollWheelDown>", "<c-x><c-e><c-x><c-e><c-x><c-e>")
vim.keymap.set({"n", "x"}, "<c-v>", "p")

vim.cmd(
  [[
set clipboard+=unnamedplus

nmap <S-Down> <C-d>
nmap <S-Up> <C-u>

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

inoremap <C-v> <C-r>+

nnoremap <silent> <Space>qt :tabclose<CR>

" nnoremap g<tab> <C-^>

" 缩进一格
" xnoremap > :call Indent('>')<CR>gv
" xnoremap < :call Indent('<')<CR>gv
" nnoremap > :s/^/ /<CR>:noh<CR>
" nnoremap < :s/^\s\=//<CR>:noh<CR>

nnoremap <silent> <C-r> :silent redo<CR>
nnoremap <silent> u :silent undo<CR>

nnoremap <silent> <Space>sq :copen<cr>

nmap <Space>wt <C-w>v<C-w>T

nnoremap <silent> <space>hn <cmd>call ToggleNormalBackground()<cr>
nnoremap <silent> <space>hc <cmd>call ToggleCursorLine()<cr>
nnoremap <silent> <space>sc <cmd>call CloseSQAndSG()<cr>
" nnoremap <silent> <Space>bD :call DeleteAllBuffers()<CR>

xnoremap a' 2i'
xnoremap a" 2i"
xnoremap a` 2i`

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

nnoremap <silent><nowait> <left> 3zh
nnoremap <silent><nowait> <right> 3zl

xnoremap J gJ

nnoremap <c-z> u
]]
)

vim.keymap.set("n", "<ScrollWheelUp>", "<C-y>")
vim.keymap.set("n", "<ScrollWheelDown>", "<C-e>")
-- vim.keymap.set("n", "<Up>", "3<C-y>")
-- vim.keymap.set("n", "<Down>", "3<C-e>")
-- vim.keymap.set('i', '<ScrollWheelUp>', '<C-y>')
-- vim.keymap.set('i', '<ScrollWheelDown>', '<C-e>')
-- vim.keymap.set('v', '<ScrollWheelUp>', '<C-y>')
-- vim.keymap.set('v', '<ScrollWheelDown>', '<C-e>')

vim.cmd(
  [[
" vnoremap p "0p
" vnoremap P "0P
" vnoremap y "0y
vnoremap x "0d
nnoremap x v"0d
vnoremap d "0d
vnoremap s "0s
" nnoremap s "0s
nnoremap yy "0yy
nnoremap dd "0dd
" noremap <Space>y "+y
" noremap <silent> <Space>y :<C-u>call ClipboardYank(visualmode())<cr>
" noremap <Space>p "+p
" noremap <Space>o "+x
" vnoremap <Space>y "+y
" vnoremap <silent> <C-c> :<C-u>call ClipboardYank(visualmode())<cr>
" noremap <C-c>y "+y
" noremap <C-v> "+p

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

" xnoremap > >gv|
" xnoremap < <gv
" nnoremap > >>_
" nnoremap < <<_

" 缩进一格
xnoremap > :s/^/ /<CR>:noh<CR>gv
xnoremap < :s/^\s\=//<CR>:noh<CR>gv
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
]]
)

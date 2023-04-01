local wk = require("which-key")

---- 快捷键
wk.setup(
  {
    key_labels = {["<leader>"] = "SPC"}
  }
)
wk.register(
  {
    mode = {"n"},
    ["<leader>w"] = {name = "Window"},
    ["<leader>wv"] = {"<cmd>vsplit<cr>", "Add vertical window"},
    ["<leader>ws"] = {"<cmd>split<cr>", "Add horizontal window"},
    ["<leader>wJ"] = {"<c-w>J", "Move current window to the bottom"},
    ["<leader>wK"] = {"<c-w>K", "Move current window to the top"},
    ["<leader>wH"] = {"<c-w>H", "Move current window to the left side"},
    ["<leader>wL"] = {"<c-w>L", "Move current window to the right side"},
    ["<leader>wq"] = {"<cmd>copen<cr>", "Open quickfix"},
    ["<leader>wt"] = {"<C-w>v<C-w>T", "Open this buffer in a new tab"}
  }
)
wk.register(
  {
    mode = {"n"},
    ["<leader>q"] = {name = "Quit / Close / Delete"},
    ["<leader>qq"] = {"<cmd>qa<cr>", "Quit vim"},
    ["<leader>qt"] = {"<cmd>tabclose<cr>", "Quit tab"},
    ["<leader>qw"] = {"<cmd>q<cr>", "Close window"},
  }
)

---- 配置
vim.cmd(
  [[
" 宏
function! s:EXECUTE_MACRO_OVER_VISUAL_RANGE()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

inoremap <C-v> <C-r>+
nnoremap <silent> <C-r> :silent redo<CR>
nnoremap <silent> u :silent undo<CR>
xnoremap a' 2i'
xnoremap a" 2i"
xnoremap a` 2i`
xnoremap > >gv|
xnoremap < <gv
" nnoremap > >>_
" nnoremap < <<_
xnoremap @ :<C-u>call <SID>EXECUTE_MACRO_OVER_VISUAL_RANGE()<CR>
nnoremap <silent><nowait> <left> 3zh
nnoremap <silent><nowait> <right> 3zl
xnoremap J gJ
nnoremap <c-z> u
]]
)
vim.keymap.set({"n", "x"}, "<ScrollWheelUp>", "<esc>3<c-y>")
vim.keymap.set({"n", "x"}, "<ScrollWheelDown>", "<esc>3<c-e>")
vim.keymap.set({"i"}, "<ScrollWheelUp>", "<c-x><c-y><c-x><c-y><c-x><c-y>")
vim.keymap.set({"i"}, "<ScrollWheelDown>", "<c-x><c-e><c-x><c-e><c-x><c-e>")
vim.keymap.set({"n", "x"}, "<c-v>", "p")

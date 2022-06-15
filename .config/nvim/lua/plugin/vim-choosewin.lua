vim.cmd(
  [[
function ChooseWinShowingStatusLine()
  let current = &laststatus
  set laststatus=2
  ChooseWin
  exec 'echo "' . current . '"'
  exec 'set laststatus=' . current
endfunction

nnoremap <space>ww <cmd>call ChooseWinShowingStatusLine()<CR>

let g:choosewin_color_label = {
    \ 'gui': ['none', 'none', 'bold'],
    \ }
let g:choosewin_color_label_current = {
    \ 'gui': [HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui')), HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')), 'bold'],
    \ }
let g:choosewin_color_overlay_current = {
    \ 'gui': [HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui')), HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui'))],
    \ }
let g:choosewin_color_overlay = {
    \ 'gui': [HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui')), HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui'))],
    \ }
let g:choosewin_color_land = {
    \ 'gui': ['none', 'none'],
    \ }
let g:choosewin_color_other = {
    \ 'gui': [HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui')), HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'fg', 'gui'))],
    \ }
]]
)

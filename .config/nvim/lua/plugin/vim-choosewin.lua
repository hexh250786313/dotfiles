vim.cmd(
  [[
nnoremap <space>ww :ChooseWin<CR>

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
]]
)

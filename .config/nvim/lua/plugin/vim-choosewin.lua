vim.cmd([[
nnoremap <space>ww :ChooseWin<CR>

let g:choosewin_color_label = {
    \ 'gui': ['none', 'none', 'bold'],
    \ }
let g:choosewin_color_label_current = {
    \ 'gui': ['#0a7aca', 'white', 'bold'],
    \ }
let g:choosewin_color_overlay_current = {
    \ 'gui': ['#0a7aca', '#0a7aca'],
    \ }
let g:choosewin_color_overlay = {
    \ 'gui': ['#0a7aca', '#0a7aca'],
    \ }
let g:choosewin_color_land = {
    \ 'gui': ['none', 'none'],
    \ }
]])

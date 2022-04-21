local api = vim.api

vim.g.coc_global_extensions = {
  "coc-css",
  "coc-eslint",
  "coc-git",
  "coc-highlight",
  "coc-html",
  "coc-json",
  "coc-lists",
  "coc-pairs",
  "coc-snippets",
  "coc-tsserver",
  "coc-lua",
  "coc-yank",
  "coc-marketplace",
  "coc-lightbulb",
  "coc-react-refactor"
}

vim.g.coc_enable_locationlist = 0
-- coc 选择了 quickfix 打开后的回调
vim.g.coc_quickfix_open_command = "CocList --auto-preview --normal --tab --number-select quickfix"

api.nvim_create_autocmd(
  {"User"},
  {pattern = "CocLocationsChange", command = "CocList --normal --tab --auto-preview location"}
)

api.nvim_create_autocmd(
  {"CursorHold"},
  {pattern = "*", command = "if (coc#rpc#ready()) | silent call CocActionAsync('highlight')"}
)

vim.cmd(
  [[
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-k> coc#refresh()

if exists('*complete_info')
inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

highlight CocListPath guibg=#455a64
highlight CocListMode guibg=#455a64

highlight CocHighlightText cterm=underline guibg=#0f6073
]]
)

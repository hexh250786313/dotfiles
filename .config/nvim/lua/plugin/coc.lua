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

-- 如果要自定义跳转行为, 则把这个设置为 0
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
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

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
nnoremap <silent> <Space>gs :CocCommand git.chunkStage<CR>
nnoremap <silent> <Space>gu :CocCommand git.chunkUndo<CR>
nnoremap <silent> <Space>gi :CocCommand git.chunkInfo<CR>
nnoremap <silent> <Space>gd :CocCommand git.diffCached<CR>
nmap <Space>g[ <Plug>(coc-git-prevchunk)
nmap <Space>g] <Plug>(coc-git-nextchunk)
nnoremap <silent> <Space>} :call CocAction('jumpDefinition', v:false)<CR>
nnoremap <silent> <Space>{ :call CocAction('jumpReferences', v:false)<CR>
nnoremap <silent> <Space>sb :CocList --no-sort --normal mru<CR>
nnoremap <silent> <Space>sw :CocList --no-sort --normal windows<CR>
nnoremap <silent> <Space>sd :CocList --no-sort --normal diagnostics<CR>
nnoremap <silent> <Space>sy :CocList --auto-preview --normal --tab --number-select yank<CR>
nnoremap <silent> <Space>] <cmd>Telescope coc definitions layout_strategy=cursor layout_config={height=0.5,width=0.9}<cr><esc>
nnoremap <silent> <Space>[ <cmd>Telescope coc references layout_strategy=cursor layout_config={height=0.5,width=0.9}<cr><esc>
nnoremap <silent> <Space>ss :CocList --no-sort --normal services<CR>
nmap <silent> <Space>sa <plug>(coc-codeaction-line)
nmap <silent> <Space>sA <plug>(coc-codeaction-cursor)
xmap <silent> <Space>sa <plug>(coc-codeaction-selected)
nnoremap <silent> gh :call <SID>show_documentation()<CR>

if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

highlight CocListPath guibg=#455a64
highlight CocListMode guibg=#455a64
highlight CocHighlightText cterm=underline guibg=#0f6073
]]
)

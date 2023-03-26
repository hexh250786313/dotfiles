local api = vim.api

vim.g.coc_global_extensions = {
  "coc-css",
  "coc-diagnostic",
  "coc-html",
  "coc-json",
  "coc-lightbulb",
  "coc-lists",
  "coc-markdown-preview-enhanced",
  "coc-marketplace",
  "coc-snippets",
  "coc-tsserver",
  "coc-webview",
  "coc-yaml",
  "coc-markmap",
  "coc-angular",
  "coc-git",
  "@hexuhua/coc-replacement",
  "@yaegassy/coc-volar",
  "@yaegassy/coc-marksman",
  "coc-tasks",
  "coc-todo-tree",
  "@yaegassy/coc-tailwindcss3",
  "coc-styled-components",
  "coc-cssmodules",
  "coc-typos",
  "@hexuhua/coc-list-files-mru",
}

-- coc 选择了 quickfix 打开后的回调
-- vim.g.coc_quickfix_open_command = "CocList --auto-preview --tab --number-select quickfix"
vim.g.coc_quickfix_open_command = "copen"

-- 如果要自定义跳转行为, 则把这个设置为 0, jumpDefinition 和 jumpDeclaration 的跳转行为
vim.g.coc_enable_locationlist = 0
api.nvim_create_autocmd(
  {"User"},
  {pattern = "CocLocationsChange", command = "CocList --number-select --auto-preview location"}
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

command! -nargs=? Fold :call CocActionAsync('fold', <f-args>)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1): copilot#Accept("\<CR>")
inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-j>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<c-j>" :
  \ coc#refresh()
inoremap <expr><c-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
" inoremap <silent><expr> <C-k> coc#refresh()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> <Space>gs :CocCommand git.chunkStage<CR>
nnoremap <silent> <Space>gu :CocCommand git.chunkUndo<CR>
nnoremap <silent> <Space>gi :CocCommand git.chunkInfo<CR>
nnoremap <silent> <Space>gd :CocCommand git.diffCached<CR>
nmap <Space>g[ <Plug>(coc-git-prevchunk)
nmap <Space>g] <Plug>(coc-git-nextchunk)
nnoremap <silent> <Space>ld :CocList --no-sort diagnostics<CR>
nnoremap <silent> <Space>lt :CocList tasks<CR>
nnoremap <silent> <Space>ly :CocList --auto-preview yanky<CR>
nnoremap <silent> <Space>ls :CocList --no-sort services<CR>
nnoremap <silent> <Space>lb :CocList --no-sort buffers<CR>
nmap <silent> <Space>la <plug>(coc-codeaction-line)
nmap <silent> <Space>lA <plug>(coc-codeaction-cursor)
xmap <silent> <Space>la <plug>(coc-codeaction-selected)
nnoremap <silent> gh :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>f :CocList --height=9 filesMru<CR>

nnoremap <silent> <Space>br :CocCommand coc-replacement.replace<CR>

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "<C-e>"
  nnoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "<C-y>"
  inoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Down>"
  inoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<Up>"
  vnoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "<C-e>"
  vnoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "<C-y>"
endif
]]
)


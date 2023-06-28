---- 快捷键
local wk = require("which-key")
wk.register({
  mode = {"n"},
  ["<leader>/"] = {":CocList grep<cr>", "Grep globally"}
})
wk.register({mode = {"x"}, ["<leader>/"] = {"<cmd>exec 'call ' . g:coc_config_sid . 'GREP_FROM_SELECTED(visualmode())'<cr>", "Grep globally"}})

---- 配置
local api = vim.api
vim.g.coc_global_extensions = {
  "coc-css", "coc-diagnostic", "coc-html", "coc-json", "coc-lightbulb", "coc-lists", "coc-markdown-preview-enhanced",
  "coc-marketplace", "coc-snippets", -- "coc-tsserver",
  "coc-webview", "coc-yaml", "coc-markmap", "coc-angular", "coc-git", "@hexuhua/coc-replacement", "@yaegassy/coc-volar",
  "@yaegassy/coc-marksman", "coc-tasks", "coc-todo-tree", "@yaegassy/coc-tailwindcss3", "coc-styled-components",
  "coc-cssmodules", "coc-typos", "@hexuhua/coc-list-files-mru", "@hexuhua/coc-copilot"
}

-- coc 选择了 quickfix 打开后的回调
vim.g.coc_quickfix_open_command = "copen"

-- 禁用默认插入模式下的 c-n keyword completion
vim.api.nvim_set_keymap('i', '<C-n>', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-p>', '<Nop>', {noremap = true})

-- coc snippets 自动跳跃
vim.g.coc_snippet_next = '<c-n>'
vim.g.coc_snippet_prev = '<c-p>'

-- 如果要自定义跳转行为, 则把这个设置为 0, jumpDefinition 和 jumpDeclaration 的跳转行为
vim.g.coc_enable_locationlist = 0
api.nvim_create_autocmd({"User"},
                        {pattern = "CocLocationsChange", command = "CocList --number-select --auto-preview location"})

vim.cmd([[
" 获取识别码
function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" 添加全局识别码
let g:coc_config_sid = s:SID_PREFIX()

" 展示文档
function! s:SHOW_DOCUMENTATION()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 回退行为
function! s:CHECK_BACKSPACE() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 从选中的文本中搜索
function! s:GREP_FROM_SELECTED(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute printf('CocList grep ', word)
endfunction

" coc#pum#next(0) 0 是不插入文本，1 是插入
inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#next(0) :
  \ <SID>CHECK_BACKSPACE() ? "\<Tab>" :
  \ coc#refresh()
inoremap <silent><expr><c-l> coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(0) : "\<C-h>"
inoremap <silent><expr> <c-j>
  \ coc#pum#visible() ? coc#pum#next(0) :
  \ <SID>CHECK_BACKSPACE() ? "\<c-j>" :
  \ coc#refresh()
inoremap <expr><c-k> coc#pum#visible() ? coc#pum#prev(0) : "\<C-k>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "3<C-e>"
  nnoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "3<C-y>"
  inoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Down>"
  inoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<Up>"
  vnoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "3<C-e>"
  vnoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "3<C-y>"
endif
]])

local api = vim.api

function _G.symbol_line()
  local curwin = vim.g.statusline_winid or 0
  local curbuf = vim.api.nvim_win_get_buf(curwin)
  local ok, line = pcall(vim.api.nvim_buf_get_var, curbuf, "coc_symbol_line")
  -- return ok and line or vim.api.nvim_buf_get_name(curbuf)
  return ok and line or vim.fn.bufname(curbuf)
end

if vim.fn.exists("&winbar") ~= 0 then
  vim.o.winbar = "%!v:lua.symbol_line()"
end

vim.g.coc_global_extensions = {
  "coc-css",
  -- "coc-eslint",
  "coc-diagnostic",
  -- "coc-highlight",
  "coc-html",
  "coc-json",
  "coc-lightbulb",
  "coc-lists",
  "coc-lua",
  "coc-markdown-preview-enhanced",
  "coc-marketplace",
  "coc-pairs",
  "coc-react-refactor",
  "coc-snippets",
  "coc-tsserver",
  "coc-webview",
  "coc-yaml",
  "coc-markmap",
  "coc-angular",
  "coc-git",
  "@hexuhua/coc-symbol-line",
  "@hexuhua/coc-replacement",
  -- "@hexuhua/coc-git",
  -- "@hexuhua/coc-yank",
  "@yaegassy/coc-volar"
}

-- coc 选择了 quickfix 打开后的回调
-- vim.g.coc_quickfix_open_command = "CocList --auto-preview --normal --tab --number-select quickfix"
vim.g.coc_quickfix_open_command = "copen"

-- 如果要自定义跳转行为, 则把这个设置为 0, jumpDefinition 和 jumpDeclaration 的跳转行为
vim.g.coc_enable_locationlist = 0
api.nvim_create_autocmd(
  {"User"},
  {pattern = "CocLocationsChange", command = "CocList --normal --tab --number-select --auto-preview location"}
)

-- api.nvim_create_autocmd(
-- {"User"},
-- {pattern = "CocOpenFloat", command = 'call setwinvar(g:coc_last_float_win, "&winblend", 20)'}
-- )

-- 移动光标根据算法高亮词语以及 buffer 中的相关词语, 有点烦人, 关掉
-- api.nvim_create_autocmd(
-- {"CursorHold"},
-- {pattern = "*", command = "if (coc#rpc#ready()) | silent call CocActionAsync('highlight')"}
-- )

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

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <C-k> coc#refresh()
nnoremap <silent> <Space>gs :CocCommand git.chunkStage<CR>
nnoremap <silent> <Space>gu :CocCommand git.chunkUndo<CR>
nnoremap <silent> <Space>gi :CocCommand git.chunkInfo<CR>
nnoremap <silent> <Space>gd :CocCommand git.diffCached<CR>
nmap <Space>g[ <Plug>(coc-git-prevchunk)
nmap <Space>g] <Plug>(coc-git-nextchunk)
nnoremap <silent> <Space>} :call CocAction('jumpDefinition', v:false)<CR>
nnoremap <silent> <Space>{ :call CocAction('jumpReferences', v:false)<CR>
" nnoremap <silent> <Space>sb :CocList --no-sort --normal mru<CR>
nnoremap <silent> <Space>sw :CocList --no-sort --normal windows<CR>
nnoremap <silent> <Space>sd :CocList --no-sort --normal diagnostics<CR>
" nnoremap <silent> <Space>sy :CocList --auto-preview --normal --tab --number-select yank<CR>
nnoremap <silent> <Space>ss :CocList --no-sort --normal services<CR>
nmap <silent> <Space>sa <plug>(coc-codeaction-line)
nmap <silent> <Space>sA <plug>(coc-codeaction-cursor)
xmap <silent> <Space>sa <plug>(coc-codeaction-selected)
nnoremap <silent> gh :call <SID>show_documentation()<CR>

nnoremap <silent> <Space>br :CocCommand coc-replacement.replace<CR>

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1, 3) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0, 3) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 3)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 3)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1, 3) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0, 3) : "\<C-b>"
endif
]]
)

-- 与 coc-settings 的 diagnosticRefresh 对应, false 相当于禁用自动刷新, 自定义刷新行为
-- silent! 可以无视报错
api.nvim_create_autocmd(
  {"CursorHold"},
  {pattern = "*", command = "if (coc#rpc#ready()) | silent! call CocActionAsync('diagnosticRefresh')"}
)
api.nvim_create_autocmd(
  {"CursorMoved"},
  {pattern = "*", command = "silent! call timer_start(1000, { -> CocActionAsync('diagnosticRefresh')})"}
)
api.nvim_create_autocmd(
  {"InsertLeave"},
  {
    pattern = "*",
    command = "if (coc#rpc#ready()) | silent! call timer_start(1000, { -> CocActionAsync('diagnosticRefresh')})"
  }
)
api.nvim_create_autocmd(
  {"InsertEnter"},
  {
    pattern = "*",
    command = "if (coc#rpc#ready()) |  silent! call timer_start(1000, { -> CocActionAsync('diagnosticToggle', 0)})"
  }
)
api.nvim_create_autocmd(
  {"InsertCharPre"},
  {pattern = "*", command = "if (coc#rpc#ready()) | silent! call CocActionAsync('diagnosticToggle', 0)"}
)
-- diagnosticToggleBuffer 看起来不太行, 提个 pr
-- api.nvim_create_autocmd({"InsertLeavePre"}, {pattern = "*", command = "silent call CocActionAsync('diagnosticToggleBuffer', 1)"})

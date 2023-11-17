---- 快捷键
local wk = require("which-key")
-- wk.register({ mode = { "n" }, ["<leader>/"] = { ":CocList grep<cr>", "Grep globally" } })
wk.register({ mode = { "n" }, ["<leader>?"] = { ":CocList grep<cr>", "Grep globally" } })
wk.register({ mode = { "n" }, ["<leader>r"] = { ":CocCommand coc-replacement.replace<cr>", "Replace" } })
wk.register({
  mode = { "x" },
  -- ["<leader>/"] = { ":<c-u>exec 'call ' . g:coc_config_sid . 'GREP_FROM_SELECTED(visualmode())'<cr>", "Grep globally" },
  ["<leader>?"] = { ":<c-u>exec 'call ' . g:coc_config_sid . 'GREP_FROM_SELECTED(visualmode())'<cr>", "Grep globally" },
})

-- lsp
wk.register({
  mode = { "n" },
  ["gr"] = { "<cmd>call CocActionAsync('jumpReferences')<cr>", "Go to references" },
  ["gd"] = { "<cmd>call CocActionAsync('jumpDefinition')<cr>", "Go to definition" },
  ["gh"] = { ":<c-u>call function(g:coc_config_sid . 'SHOW_DOCUMENTATION')()<cr>", "Show docs for item under cursor" },
})

-- files
wk.register({ mode = { "n" }, ["<leader>f"] = { "<cmd>CocList --height=9 filesMru<cr>", "Open file picker" } })

-- git
wk.register({
  mode = { "n" },
  ["<leader>gs"] = { "<cmd>CocCommand git.chunkStage<cr>", "Stage git chunk" },
  ["<leader>gu"] = { "<cmd>CocCommand git.chunkUndo<cr>", "Undo git chunk" },
  ["<leader>gi"] = { "<cmd>CocCommand git.chunkInfo<cr>", "Show git chunk info" },
  ["<leader>gd"] = { "<cmd>CocCommand git.diffCached<cr>", "Show git chunk diff info" },
  ["[g"] = { "<Plug>(coc-git-prevchunk)", "Go to previous change" },
  ["]g"] = { "<Plug>(coc-git-nextchunk)", "Go to next change" },
})

-- list
wk.register({
  mode = { "n" },
  ["<leader>ld"] = { "<cmd>CocList --no-sort diagnostics<cr>", "Diagnostics list" },
  ["<leader>lt"] = { "<cmd>CocList tasks<cr>", "Tasks list" },
  ["<leader>ls"] = { "<cmd>CocList --no-sort services<cr>", "LSP Services list" },
  ["<leader>lr"] = { ":CocListResume<cr>", "Resume list" },
  ["<leader>lw"] = { ":CocList typos<cr>", "List typos" },
})

-- Actions
wk.register({
  mode = { "n" },
  ["<leader>aa"] = { "<plug>(coc-codeaction-line)", "LSP CodeActions list for line" },
  ["<leader>aA"] = { "<plug>(coc-codeaction-cursor)", "LSP CodeActions list for cursor" },
  ["<leader>af"] = { "<Plug>(coc-fix-current)", "Try first quickfix action for diagnostics of current line" },
  ["<leader>aF"] = { "<plug>(coc-codeaction)", "LSP CodeActions list for current file" },
  ["<leader>as"] = { "<plug>(coc-codeaction-source)", "LSP CodeActions list for current file(source)" },
  ["<leader>ar"] = { "<lug>(coc-codeaction-refactor)", "Get and run refactor code action(s) at current cursor" },
  ["<leader>aw"] = { "<Plug>(coc-typos-fix)", "Fix typos" },
})
wk.register({ mode = { "x" }, ["<leader>aa"] = { "<plug>(coc-codeaction-selected)", "LSP CodeActions list" } })
wk.register({
  mode = { "x" },
  ["<leader>ar"] = { "<plug>(coc-codeaction-refactor-selected)",
                     "Get and run refactor code action(s) at current cursor" },
})

---- 配置
local api = vim.api
vim.g.coc_global_extensions = {
  "coc-css",
  "coc-diagnostic",
  "coc-html",
  "coc-json",
  "coc-lists",
  "coc-markdown-preview-enhanced",
  "coc-marketplace",
  "coc-snippets",
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
  "coc-typos",
  "@hexuhua/coc-list-files-mru",
  "@hexuhua/coc-copilot",
  "coc-symbol-line",
  "coc-tsserver",
  "coc-rust-analyzer",
  "coc-sumneko-lua",
  -- "coc-lightbulb",
  -- "coc-cssmodules",
}

-- coc 选择了 quickfix 打开后的回调
vim.g.coc_quickfix_open_command = "copen"

-- 禁用默认插入模式下的 c-n keyword completion
vim.api.nvim_set_keymap('i', '<C-n>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-p>', '<Nop>', { noremap = true })

-- coc snippets 自动跳跃
vim.g.coc_snippet_next = '<c-n>'
vim.g.coc_snippet_prev = '<c-p>'

-- 如果要自定义跳转行为, 则把这个设置为 0, jumpDefinition 和 jumpDeclaration 的跳转行为
vim.g.coc_enable_locationlist = 0
api.nvim_create_autocmd({ "User" },
                        { pattern = "CocLocationsChange", command = "CocList --number-select --auto-preview location" })

vim.cmd([[
" 获取识别码
function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" 添加全局识别码
let g:coc_config_sid = s:SID_PREFIX()

" 展示函数的 signature help 同时刷新补全面板（showSignatureHelp 可能会带来一定性能问题）
function! s:COC_REFRESH_AND_SIGNATURE_HELP()
  call CocActionAsync('showSignatureHelp')
  return coc#refresh() " 此处必须返回，否则 coc#refresh() 不生效
endfunction

" 展示文档
function! s:SHOW_DOCUMENTATION()
  let winid = luaeval("require('ufo').peekFoldedLinesUnderCursor()")
  if (winid)
    return
  endif
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('definitionHover')
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

  " 转义 rg 的保留符号
  let wordA = substitute(@@, '\', '\\\\\', 'g')
  let wordB = substitute(wordA, '\.', '\\.', 'g')
  let wordC = substitute(wordB, '\$', '\\$', 'g')
  let word1 = substitute(wordC, '\n$', '', 'g')
  let word2 = escape(word1, '| ')
  let word3 = substitute(word2, '(', '\\(', 'g')
  let word4 = substitute(word3, ')', '\\)', 'g')
  let word5 = substitute(word4, '}', '\\}', 'g')
  let word6 = substitute(word5, '{', '\\{', 'g')
  let word7 = substitute(word6, '<', '\\<', 'g')
  let word8 = substitute(word7, '>', '\\>', 'g')
  let word7 = substitute(word6, ']', '\\]', 'g')
  let word8 = substitute(word7, '[', '\\[', 'g')
  let word9 = substitute(word8, '-', '\\-', 'g')
  let word10 = substitute(word9, 'iuo', 'iuo', 'g')
  let word10 = substitute(word9, '*', '\\*', 'g')
  let word11 = substitute(word10, '+', '\\+', 'g')
  let word12 = substitute(word11, '?', '\\?', 'g')
  let word13 = substitute(word12, '\^', '\\^', 'g')
  let word = word13

  let @@ = saved_unnamed_register
  execute 'CocList -A grep ' . word
endfunction

" coc#pum#next(0) 0 是不插入文本，1 是插入
inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#next(0) :
  \ <SID>CHECK_BACKSPACE() ? "\<Tab>" :
  \ coc#refresh()
" inoremap <silent><expr><c-l> coc#refresh()
inoremap <silent><expr><c-l> <SID>COC_REFRESH_AND_SIGNATURE_HELP()
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

-- coc-symbol-line
function _G.symbol_line()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
  local ok, line = pcall(vim.api.nvim_buf_get_var, bufnr, 'coc_symbol_line')
  return ok and '%#CocSymbolLine# ' .. line or ''
end
if vim.fn.exists '&winbar' then
  vim.api.nvim_create_autocmd({ 'CursorHold', 'WinEnter', 'BufWinEnter' }, {
    callback = function()
      local is_diff = vim.wo.diff
      if vim.b.coc_symbol_line and vim.bo.buftype == '' and not is_diff then
        if vim.opt_local.winbar:get() == '' then
          vim.opt_local.winbar = '%!v:lua.symbol_line()'
        end
      else
        vim.opt_local.winbar = ''
      end
    end,
  })
end

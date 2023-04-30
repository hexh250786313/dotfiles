---------> 快捷键
local wk = require("which-key")
wk.register({["<leader>F"] = {"<cmd>exec 'call ' . g:fzf_config_sid . 'FZF()'<cr>", "Open file picker"}})

---------> 配置
vim.cmd([[
" 获取识别码
function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" 添加全局 fzf 识别码
let g:fzf_config_sid = s:SID_PREFIX()

" 精简路径
function! s:SHORT_PATH() abort
  let short = fnamemodify(getcwd(), ':~:.')
  let short = pathshorten(short)
  let slash = '/'
  return empty(short) ? '~'.slash : short . (short =~ escape(slash, '\').'$' ? '' : slash)
endfunction

function! s:FZF(...)
  let l:opts = fzf#wrap('FZF', { 'options': ['--multi', '--reverse', '--prompt=' . s:SHORT_PATH() ] })
  let args = copy(a:000)
  if len(args) == 1
    let opts.source = args[0]
  elseif exists("g:fzf_source")
    let opts.source = g:fzf_source
  endif
  call fzf#run(opts)
endfunction

let g:fzf_colors =
\ { 'fg':      ['fg', 'Comment'],
  \ 'bg':      ['bg', 'StatusLine'],
  \ 'hl':      ['fg', 'DiagnosticInfo'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'StatusLine'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['bg', 'StatusLine'],
  \ 'prompt':  ['fg', 'DiagnosticHint'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
]])

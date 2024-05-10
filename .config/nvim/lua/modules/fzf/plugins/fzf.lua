---------> 快捷键
local wk = require("which-key")
-- wk.register({ ["<leader>F"] = { "<cmd>exec 'call ' . g:fzf_config_sid . 'FZF()'<cr>", "Open file picker" } })
wk.register({ ["<leader>f"] = { "<cmd>exec 'call ' . g:fzf_config_sid . 'FZF()'<cr>", "Open file picker" } })

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

let g:fzf_layout = { 'window': { 'width': 0.77, 'height': 0.86 } }

function! s:FZF(...)
  let l:opts = fzf#wrap('FZF', { 'options': ['--multi', '--reverse', '--prompt=' . s:SHORT_PATH(), '--cycle' ] })
  let args = copy(a:000)
  let cwd = getcwd()
  if len(args) == 1
    let opts.source = args[0]
  elseif exists("g:fzf_source")
    let opts.source = g:fzf_source
  else
    " 没有指定 source 的情况下，默认使用 mru/fd 动态切换源
    let opts = fzf#wrap('FZF', { 'options': [
    \ '--bind', 'ctrl-p:toggle-preview',
    \ '--bind', 'up:preview-up,down:preview-down',
    \ '--preview', 'COLORTERM=truecolor bat --style=numbers --color=always --line-range :100 {}',
    \ '--preview-window', 'bottom:50%',
    \ '--cycle',
    \ '--multi',
    \ '--reverse',
    \ '--prompt=' . s:SHORT_PATH(),
    \ '--bind=' . 'change:reload($HOME/.config/nvim/lua/modules/fzf/plugins/dynamic_fzf_source.sh ' . cwd . ' {q})'
    \] })
    let opts.source = "perl -ne 'print substr(\$_, length(\"" . cwd . "/\")) if m{^" . cwd . "/} && !$seen{\$_}++' ~/.config/coc/mru"
  endif
  call fzf#run(opts)
endfunction

function! s:BUILD_QUICKFIX_LIST(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
endfunction

let g:fzf_action =
\ { 'ctrl-q': function('s:BUILD_QUICKFIX_LIST'),
\ }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:toggle-all'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Comment'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'DiagnosticInfo'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'StatusLine'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'DiagnosticHint'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'border':  ['fg', 'Normal'],
  \ 'header':  ['fg', 'Comment'] }
]])
-- \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'], -- 选中行的背景 + 箭头前面那一列奇怪的竖线
-- \ 'border':  ['bg', 'StatusLine'], -- 边框

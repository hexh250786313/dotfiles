vim.cmd(
  [[
function! s:shortpath()
  let short = fnamemodify(getcwd(), ':~:.')
  let short = pathshorten(short)
  let slash = '/'
  return empty(short) ? '~'.slash : short . (short =~ escape(slash, '\').'$' ? '' : slash)
endfunction

function! MyFZF(...)
  let l:opts = fzf#wrap('FZF', { 'options': ['--multi', '--reverse', '--prompt=' . s:shortpath() ] })
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

nnoremap <silent> <space>sf :call MyFZF()<cr>
]]
)

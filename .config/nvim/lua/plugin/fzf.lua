vim.keymap.set("n", "<space>sf", ":FZF<cr>", {silent = true})

vim.cmd(
  [[
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
]]
)

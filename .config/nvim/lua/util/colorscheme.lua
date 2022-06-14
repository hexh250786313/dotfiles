vim.cmd(
  [[
function! HandleColorNONE(color)
  if a:color != ''
    return a:color
  else
    return "NONE"
  end
endfunction

let g:hlnormalstate=0
function ToggleNormalBackground()
  if g:hlnormalstate == 1
    let g:hlnormalstate=0
    hi! Normal guibg=NONE
  else
    let g:hlnormalstate=1
    exec 'hi! Normal' .
      \' guibg=' . g:defaultnormalgb
  endif
endfunction

let g:hlcursorlinestate=1
function ToggleCursorLineBackground()
  if g:hlcursorlinestate == 1
    let g:hlcursorlinestate=0
    hi! CursorLine guibg=NONE
  else
    let g:hlcursorlinestate=1
    exec 'hi! CursorLine' .
      \' guibg=' . g:defaultnormalgb .
      \' gui=' . g:defaultcursorlinegui
  endif
endfunction

]]
)

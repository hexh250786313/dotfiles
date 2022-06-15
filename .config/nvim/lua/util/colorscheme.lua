vim.cmd(
  [[
function! HandleColorNONE(color)
  if a:color != ''
    return a:color
  else
    return "NONE"
  end
endfunction

function ToggleNormalBackground()
  if g:hlnormalstate == 1
    let g:hlnormalstate=0
    hi! Normal guibg=NONE
    exec 'hi! NormalStrongFont gui=italic,bold' .
      \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')) .
      \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui'))
  else
    let g:hlnormalstate=1
    exec 'hi! Normal' .
      \' guibg=' . g:defaultnormalgb
    exec 'hi! NormalStrongFont gui=italic,bold' .
      \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')) .
      \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui'))
  endif
endfunction

function ToggleCursorLineBackground()
  if g:hlcursorlinestate == 1
    let g:hlcursorlinestate=0
    hi! CursorLine guibg=NONE
  else
    let g:hlcursorlinestate=1
    exec 'hi! CursorLine' .
      \' guibg=' . g:defaultcursorlinegb
  endif
endfunction

]]
)

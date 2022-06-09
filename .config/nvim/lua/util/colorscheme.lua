vim.cmd([[
function! HandleColorNONE(color)
  if a:color != ''
    return a:color
  else
    return "NONE"
  end
endfunction

let g:hlnormalstate=0
function ToggleBackground()
  if g:hlnormalstate == 1
    let g:hlnormalstate=0
    highlight! Normal guibg=NONE
  else
    let g:hlnormalstate=1
    exec 'hi! Normal' .
      \' guibg=' . g:defaultnormalgb
  endif
endfunction

]])

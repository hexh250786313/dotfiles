vim.opt.background = "dark" -- 背景 "light" | "dark"

vim.cmd(
  [[
try
    " colorscheme everforest
    colorscheme vscode
    let g:everforest_background = 'medium'
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry

let g:defaultnormalgb=HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui'))
let g:defaultcursorlinegb=HandleColorNONE(synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui'))

" 全局 Normal 不能设置 gui, 但是 winhighlight 可以
let g:hlnormalstate=1
" hi! Normal guibg=NONE

let g:hlcursorlinestate=1
" hi! CursorLine guibg=NONE

hi! LineNr guibg=NONE
hi! SignColumn guibg=NONE
hi! EndOfBuffer guibg=NONE

hi! link CocFloating Normal
hi! link CocListPath StatusLine
hi! link CocListMode StatusLine

exec 'hi! NormalStrongFont gui=italic,bold' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')) .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui'))

hi! TSString gui=italic
hi! TSCharacter gui=italic
hi! TSNumber gui=italic
hi! TSBoolean gui=italic
hi! TSFloat gui=italic
hi! TSParameter gui=italic
hi! TSFuncBuiltin gui=bold
hi! TSFunction gui=bold
hi! TSFuncMacro gui=bold
hi! TSMethod gui=bold
hi! TSConstructor gui=bold
hi! TSKeyword gui=italic
hi! TSInclude gui=italic
hi! TSVariable gui=italic
hi! TSVariableBuiltin gui=italic
hi! TSTag gui=bold
exec 'hi! TSTagAttribute gui=italic' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSVariableBuiltin')), 'fg', 'gui'))

exec 'hi! DefxIconsNestedTreeIcon guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui'))
exec 'hi! DefxIconsParentDirectory guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui'))
exec 'hi! DefxIconsOpenedTreeIcon guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui'))
exec 'hi! DefxIconsClosedTreeIcon guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui'))
exec 'hi! DefxIconsDirectory guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui'))
exec 'hi! DefxIconsSymlinkDirectory guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui'))
exec 'hi! DefxIconsCopyIcon guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('WarningMsg')), 'fg', 'gui'))
exec 'hi! DefxIconsMoveIcon guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('ErrorMsg')), 'fg', 'gui'))
exec 'hi! Defx_filename_directory gui=bold,italic,underline' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('PreProc')), 'fg', 'gui'))

exec 'hi! CocHighlightText' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('LspReferenceText')), 'bg', 'gui'))
exec 'hi! WinBar' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'fg', 'gui')) .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui'))
  \' gui=bold'
exec 'hi! CocSymbolLine gui=bold' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'fg', 'gui')) .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui'))
exec 'hi! LightBulbVirtualText' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Special')), 'fg', 'gui'))
exec 'hi! CocGitSignChange' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffChange')), 'bg', 'gui'))
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffChange')), 'bg', 'gui'))
exec 'hi! CocGitSignAdd' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffAdd')), 'bg', 'gui'))
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffAdd')), 'bg', 'gui'))
exec 'hi! CocGitSignDelete' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffDelete')), 'bg', 'gui'))
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffDelete')), 'bg', 'gui'))

exec 'hi! ScrollView guifg=NONE' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui'))
]]
)

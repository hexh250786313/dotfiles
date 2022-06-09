vim.cmd(
  [[
try
    colorscheme vscode
    " colorscheme codedark
    " colorscheme zenbones
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry

hi! Normal guibg=NONE
hi! LineNr guibg=NONE
hi! SignColumn guibg=NONE
hi! EndOfBuffer guibg=NONE

hi! link CocFloating Normal
hi! link CocListPath StatusLine
hi! link CocListMode StatusLine

exec 'hi! TSString gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSString')), 'fg', 'gui')
exec 'hi! TSCharacter gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSCharacter')), 'fg', 'gui')
exec 'hi! TSNumber gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSNumber')), 'fg', 'gui')
exec 'hi! TSBoolean gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSBoolean')), 'fg', 'gui')
exec 'hi! TSFloat gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSFloat')), 'fg', 'gui')
exec 'hi! TSParameter gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSParameter')), 'fg', 'gui')
exec 'hi! TSFuncBuiltin gui=bold' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSFuncBuiltin')), 'fg', 'gui')
exec 'hi! TSFunction gui=bold' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSFunction')), 'fg', 'gui')
exec 'hi! TSFuncMacro gui=bold' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSFuncMacro')), 'fg', 'gui')
exec 'hi! TSMethod gui=bold' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSMethod')), 'fg', 'gui')
exec 'hi! TSConstructor gui=bold' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSConstructor')), 'fg', 'gui')
exec 'hi! TSKeyword gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSKeyword')), 'fg', 'gui')
exec 'hi! TSInclude gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSInclude')), 'fg', 'gui')
exec 'hi! TSVariable gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSVariable')), 'fg', 'gui')
exec 'hi! TSVariableBuiltin gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSVariableBuiltin')), 'fg', 'gui')
exec 'hi! TSTag gui=bold' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSTag')), 'fg', 'gui')
exec 'hi! TSTagAttribute gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('TSVariableBuiltin')), 'fg', 'gui')

exec 'hi! DefxIconsNestedTreeIcon guibg=NONE' .
  \' guifg=' . synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui')
exec 'hi! DefxIconsParentDirectory guibg=NONE' .
  \' guifg=' . synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui')
exec 'hi! DefxIconsOpenedTreeIcon guibg=NONE' .
  \' guifg=' . synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui')
exec 'hi! DefxIconsClosedTreeIcon guibg=NONE' .
  \' guifg=' . synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui')
exec 'hi! DefxIconsDirectory guibg=NONE' .
  \' guifg=' . synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui')
exec 'hi! DefxIconsSymlinkDirectory guibg=NONE' .
  \' guifg=' . synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui')
exec 'hi! DefxIconsCopyIcon guibg=NONE' .
  \' guifg=' . synIDattr(synIDtrans(hlID('WarningMsg')), 'fg', 'gui')
exec 'hi! DefxIconsMoveIcon guibg=NONE' .
  \' guifg=' . synIDattr(synIDtrans(hlID('ErrorMsg')), 'fg', 'gui')
exec 'hi! Defx_filename_directory gui=bold,italic,underline' .
  \' guifg=' . synIDattr(synIDtrans(hlID('PreProc')), 'fg', 'gui')

exec 'hi! CocHighlightText' .
  \' guibg=' . synIDattr(synIDtrans(hlID('LspReferenceText')), 'bg', 'gui')
exec 'hi! CocSymbolLine gui=bold' .
  \' guifg=' . synIDattr(synIDtrans(hlID('StatusLine')), 'fg', 'gui') .
  \' guibg=' . synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui')
exec 'hi! LightBulbVirtualText' .
  \' guibg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui') .
  \' guifg=' . synIDattr(synIDtrans(hlID('Special')), 'fg', 'gui')

]]
)

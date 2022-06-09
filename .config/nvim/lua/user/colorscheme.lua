vim.opt.background = "dark" -- 背景 "light" | "dark"

vim.cmd(
  [[
try
    colorscheme vscode
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry

let g:defaultnormalgb=HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui'))

hi! Normal guibg=NONE
hi! LineNr guibg=NONE
hi! SignColumn guibg=NONE
hi! EndOfBuffer guibg=NONE

hi! link CocFloating Normal
hi! link CocListPath StatusLine
hi! link CocListMode StatusLine

exec 'hi! TSString gui=italic' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSString')), 'fg', 'gui'))
exec 'hi! TSCharacter gui=italic' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSCharacter')), 'fg', 'gui'))
exec 'hi! TSNumber gui=italic' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSNumber')), 'fg', 'gui'))
exec 'hi! TSBoolean gui=italic' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSBoolean')), 'fg', 'gui'))
exec 'hi! TSFloat gui=italic' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFloat')), 'fg', 'gui'))
exec 'hi! TSParameter gui=italic' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSParameter')), 'fg', 'gui'))
exec 'hi! TSFuncBuiltin gui=bold' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFuncBuiltin')), 'fg', 'gui'))
exec 'hi! TSFunction gui=bold' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFunction')), 'fg', 'gui'))
exec 'hi! TSFuncMacro gui=bold' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFuncMacro')), 'fg', 'gui'))
exec 'hi! TSMethod gui=bold' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSMethod')), 'fg', 'gui'))
exec 'hi! TSConstructor gui=bold' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSConstructor')), 'fg', 'gui'))
exec 'hi! TSKeyword gui=italic' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSKeyword')), 'fg', 'gui'))
exec 'hi! TSInclude gui=italic' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSInclude')), 'fg', 'gui'))
exec 'hi! TSVariable gui=italic' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSVariable')), 'fg', 'gui'))
exec 'hi! TSVariableBuiltin gui=italic' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSVariableBuiltin')), 'fg', 'gui'))
exec 'hi! TSTag gui=bold' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSTag')), 'fg', 'gui'))
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
exec 'hi! CocSymbolLine gui=bold' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'fg', 'gui')) .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui'))
exec 'hi! LightBulbVirtualText' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Special')), 'fg', 'gui'))

exec 'hi! ScrollView guifg=NONE' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui'))
]]
)

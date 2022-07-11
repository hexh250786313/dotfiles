vim.opt.background = "dark" -- 背景 "light" | "dark"

vim.cmd(
  [[
let g:everforest_background = 'medium'
let g:everforest_better_performance = 1

colorscheme vscode

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

exec 'hi! TSString gui=italic' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSString')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSString')), 'fg', 'gui'))
exec 'hi! TSCharacter gui=italic' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSCharacter')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSCharacter')), 'fg', 'gui'))
exec 'hi! TSNumber gui=italic' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSNumber')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSNumber')), 'fg', 'gui'))
exec 'hi! TSBoolean gui=italic' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSBoolean')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSBoolean')), 'fg', 'gui'))
exec 'hi! TSFloat gui=italic' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFloat')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFloat')), 'fg', 'gui'))
exec 'hi! TSParameter gui=italic' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSParameter')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSParameter')), 'fg', 'gui'))
exec 'hi! TSFuncBuiltin gui=bold' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFuncBuiltin')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFuncBuiltin')), 'fg', 'gui'))
exec 'hi! TSFunction gui=bold' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFunction')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFunction')), 'fg', 'gui'))
exec 'hi! TSFuncMacro gui=bold' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFuncMacro')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSFuncMacro')), 'fg', 'gui'))
exec 'hi! TSMethod gui=bold' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSMethod')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSMethod')), 'fg', 'gui'))
exec 'hi! TSConstructor gui=bold' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSConstructor')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSConstructor')), 'fg', 'gui'))
exec 'hi! TSKeyword gui=italic' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSKeyword')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSKeyword')), 'fg', 'gui'))
exec 'hi! TSInclude gui=italic' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSInclude')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSInclude')), 'fg', 'gui'))
exec 'hi! TSVariable gui=italic' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSVariable')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSVariable')), 'fg', 'gui'))
exec 'hi! TSVariableBuiltin gui=italic' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSVariableBuiltin')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSVariableBuiltin')), 'fg', 'gui'))
exec 'hi! TSTag gui=bold' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSTag')), 'bg', 'gui')) .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSTag')), 'fg', 'gui'))
exec 'hi! TSTagAttribute gui=italic' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('TSTagAttribute')), 'bg', 'gui')) .
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
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffChange')), 'bg', 'gui')) .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffChange')), 'bg', 'gui'))
exec 'hi! CocGitSignAdd' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffAdd')), 'bg', 'gui')) .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffAdd')), 'bg', 'gui'))
exec 'hi! CocGitSignDelete' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffDelete')), 'bg', 'gui')) .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffDelete')), 'bg', 'gui'))

exec 'hi! ScrollView guifg=NONE' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui'))
]]
)

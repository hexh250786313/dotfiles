vim.opt.background = "dark" -- 背景 "light" | "dark"

vim.cmd(
  [[
let g:everforest_background = 'medium'
let g:everforest_better_performance = 0
let g:gruvbox_material_foreground = 'original'

colorscheme gruvbox-material

let g:defaultnormalgb=HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui'))

" 全局 Normal 不能设置 gui, 但是 winhighlight 可以
" 不透明
" let g:hlnormalstate=1
" set cursorline

" 透明
let g:hlnormalstate=0
hi! Normal guibg=NONE
set nocursorline

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

exec 'hi! DefxIconsDefaultIcon guibg=NONE guifg=#6d8086'
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
exec 'hi! WinBar gui=bold' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'fg', 'gui')) .
  \' guibg=none'
exec 'hi! CocSymbolLine gui=bold' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'fg', 'gui')) .
  \' guibg=none'
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
exec 'hi! CocMenuSel' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffAdd')), 'bg', 'gui'))
exec 'hi! CocListLine' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('DiffAdd')), 'bg', 'gui'))
exec 'hi! CocFloating' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui'))
exec 'hi! CocFloatDividingLine' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui'))

exec 'hi! CocErrorVirtualText' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocErrorFloat')), 'fg', 'gui')) .
  \' guibg=' . Darken(synIDattr(synIDtrans(hlID('CocErrorFloat')), 'fg', 'gui'))
exec 'hi! CocWarningVirtualText' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocWarningFloat')), 'fg', 'gui')) .
  \' guibg=' . Darken(synIDattr(synIDtrans(hlID('CocWarningFloat')), 'fg', 'gui'))
exec 'hi! CocInfoVirtualText' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocInfoFloat')), 'fg', 'gui')) .
  \' guibg=' . Darken(synIDattr(synIDtrans(hlID('CocInfoFloat')), 'fg', 'gui'))
exec 'hi! CocHintVirtualText' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocHintFloat')), 'fg', 'gui')) .
  \' guibg=' . Darken(synIDattr(synIDtrans(hlID('CocHintFloat')), 'fg', 'gui'))

exec 'hi! ScrollView guifg=NONE' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui'))

exec 'hi! ScrollbarHandle guifg=NONE' .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui'))
exec 'hi! ScrollbarError guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocErrorFloat')), 'fg', 'gui'))
exec 'hi! ScrollbarErrorHandle' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocErrorFloat')), 'fg', 'gui')) .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui'))
exec 'hi! ScrollbarWarn guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocWarningFloat')), 'fg', 'gui'))
exec 'hi! ScrollbarWarnHandle' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocWarningFloat')), 'fg', 'gui')) .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui'))
exec 'hi! ScrollbarInfo guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocInfoFloat')), 'fg', 'gui'))
exec 'hi! ScrollbarInfoHandle' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocInfoFloat')), 'fg', 'gui')) .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui'))
exec 'hi! ScrollbarHint guibg=NONE' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocHintFloat')), 'fg', 'gui'))
exec 'hi! ScrollbarHintHandle' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocHintFloat')), 'fg', 'gui')) .
  \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Visual')), 'bg', 'gui'))

exec 'hi! DiagnosticError' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocErrorVirtualText')), 'fg', 'gui')) .
  \' guibg=' . Darken(synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui'))
exec 'hi! DiagnosticWarn' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocWarningVirtualText')), 'fg', 'gui')) .
  \' guibg=' . Darken(synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui'))
exec 'hi! DiagnosticInfo' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocInfoVirtualText')), 'fg', 'gui')) .
  \' guibg=' . Darken(synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui'))
exec 'hi! DiagnosticHint' .
  \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('CocHintVirtualText')), 'fg', 'gui')) .
  \' guibg=' . Darken(synIDattr(synIDtrans(hlID('StatusLine')), 'bg', 'gui'))

" disable the default highlight group
let g:conflict_marker_highlight_group = ''

" Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'

hi! ConflictMarkerBegin guibg=#2f7366
hi! ConflictMarkerOurs guibg=#2e5049
hi! ConflictMarkerTheirs guibg=#344f69
hi! ConflictMarkerEnd guibg=#2f628e
hi! ConflictMarkerCommonAncestorsHunk guibg=#754a81
]]
)

vim.cmd(
  [[
try
    colorscheme codedark
    " colorscheme zenbones
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry

"
highlight! Normal ctermbg=NONE guibg=NONE
highlight! LineNr ctermbg=NONE guibg=NONE
highlight! SignColumn ctermbg=NONE guibg=NONE
highlight! EndOfBuffer ctermbg=NONE guibg=NONE

highlight CursorLine guibg=#23272e
hi! LightBulbVirtualText guibg=#23272e guifg=#ffff00

highlight TSString gui=italic guifg=#CE9178
highlight TSCharacter gui=italic guifg=#CE9178
highlight TSNumber gui=italic guifg=#B5CEA8
highlight TSBoolean gui=italic guifg=#569CD6
highlight TSFloat gui=italic guifg=#B5CEA8

highlight TSParameter gui=italic guifg=#9CDCFE

highlight TSFuncBuiltin gui=Bold guifg=#DCDCAA
highlight TSFunction gui=Bold guifg=#DCDCAA
highlight TSFuncMacro gui=Bold guifg=#DCDCAA
highlight TSMethod gui=Bold guifg=#DCDCAA
highlight TSConstructor gui=Bold guifg=#4EC9B0
highlight TSKeyword gui=italic guifg=#569CD6
highlight TSInclude gui=italic guifg=#c586c0
highlight TSVariable gui=italic guifg=#4ec9b0
highlight TSVariableBuiltin gui=italic guifg=#9CDCFE
highlight TSTag gui=Bold guifg=#569CD6
highlight TSTagAttribute gui=italic guifg=#9CDCFE

:hi DefxIconsNestedTreeIcon guibg=NONE guifg=#569CD6
:hi DefxIconsParentDirectory guibg=NONE guifg=#569CD6
:hi DefxIconsOpenedTreeIcon guibg=NONE guifg=#569CD6
:hi DefxIconsClosedTreeIcon guibg=NONE guifg=#569CD6
:hi DefxIconsDirectory guibg=NONE guifg=#569CD6
:hi DefxIconsSymlinkDirectory guibg=NONE guifg=#569CD6
:hi DefxIconsCopyIcon guibg=NONE guifg=#ce9178
:hi DefxIconsMoveIcon guibg=NONE guifg=#f04747

exec 'hi Defx_filename_directory gui=italic' .
  \' guifg=' . synIDattr(synIDtrans(hlID('PreProc')), 'fg', 'gui')

highlight CocListPath guibg=#455a64
highlight CocListMode guibg=#455a64
highlight CocHighlightText cterm=underline guibg=#0f6073
hi! LightBulbVirtualText guibg=#23272e guifg=#ffff00

highlight DiffAdd guibg=#235049
highlight DiffDelete guibg=#341c28 guifg=#341c28
highlight DiffChange guibg=#344f69
highlight DiffText guibg=#2f628e

highlight CocFloating guibg=Normal guifg=Normal

highlight CocSymbolLine guibg=#373737 guifg=#ffffff
]]
)

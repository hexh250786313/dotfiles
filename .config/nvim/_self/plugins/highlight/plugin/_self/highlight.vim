function _self#highlight#toggle_normal_background()
  if g:hlnormalstate == 1
    let g:hlnormalstate=0
    hi! Normal guibg=NONE
    exec 'hi! NormalStrongFont gui=italic,bold' .
      \' guifg=' . _self#highlight#pick('Normal', 'fg') .
      \' guibg=' . _self#highlight#pick('Normal', 'bg')
  else
    let g:hlnormalstate=1
    exec 'hi! Normal' .
      \' guibg=' . g:defaultnormalgb
    exec 'hi! NormalStrongFont gui=italic,bold' .
      \' guifg=' . _self#highlight#pick('Normal', 'fg') .
      \' guibg=' . _self#highlight#pick('Normal', 'bg')
  endif
endfunction

function _self#highlight#toggle_cursorline()
  if &cursorline == 1
    set nocursorline
  else
    set cursorline
  endif
endfunction

" 这种方式和 link 不同, 可以单独设置 gui / guibg / guifg, 但是确无法像 link 同步修改, 也就是只能初始化
function! _self#highlight#pick(color, ground) abort
  let src = synIDattr(synIDtrans(hlID(a:color)), a:ground, 'gui')
  if src != ""
    return src
  else
    return "NONE"
  end
endfunction

" 把颜色明度变为 19%, 相当于变暗处理
function! _self#highlight#darken(color, ground) abort
  let src = synIDattr(synIDtrans(hlID(a:color)), a:ground, 'gui')
  if src != ''
    let l:hsl = _self#color#convert_color_to('hsl', src)
    " let l:bright = matchstr(l:hsl, '\v, \zs(\d*)\ze\%\)') " {{TEXT}}\zs{{MATCH}} -- 前面为{{TEXT}}的{{MATCH}} ; {{MATCT}}\ze{{TEXT}} -- 后面为{{TEXT}}的{{MATCH}} ; \v: 魔法字符 :help magic
    let l:bright = match(l:hsl, '\v, \zs(\d*)\ze\%\)') " {{TEXT}}\zs{{MATCH}} -- 前面为{{TEXT}}的{{MATCH}} ; {{MATCT}}\ze{{TEXT}} -- 后面为{{TEXT}}的{{MATCH}} ; \v: 魔法字符 :help magic
    let l:nextHsl = substitute(l:hsl, '\v, \zs(\d*)\ze\%\)', '19', 'g') " Converted hsl(42, 95%, 58%) -> hsl(42, 95%, 19%)
    if l:nextHsl != -1
      return _self#color#convert_color_to('hex', l:nextHsl)
    else
      return src
    end
  else
    return "NONE"
  end
endfunction

let g:gruvbox_material_better_performance = 0
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'material'

colorscheme gruvbox-material

let g:defaultnormalgb=_self#highlight#pick('Normal', 'bg')

" 全局 Normal 不能设置 gui, 但是 winhighlight 可以
" 不透明
let g:hlnormalstate=1
set cursorline

" 透明
" let g:hlnormalstate=0
" hi! Normal guibg=NONE
" set nocursorline

hi! LineNr guibg=NONE
hi! SignColumn guibg=NONE
hi! EndOfBuffer guibg=NONE

hi! link CocFloating Normal
hi! link CocListPath StatusLine
hi! link CocListMode StatusLine
hi! link NormalNC Normal

hi! link UfoCursorFoldedLine DiffChange

" hi! CursorWord gui=underline
hi! CursorWord guibg=#303731 gui=none

exec 'hi! DiffText' .
  \' guifg=none' .
  \' guibg=' . _self#highlight#darken('DiffChange', 'bg')

exec 'hi! VirtColumn' .
  \' guifg=' . _self#highlight#pick('DiffChange', 'bg')

" exec 'hi! Folded' .
"   \' guifg=' . _self#highlight#pick('FoldColumn', 'fg') .
"   \' guibg=#343632'
" exec 'hi! NormalStrongFont gui=italic,bold' .
exec 'hi! NormalStrongFont gui=italic' .
  \' guifg=' . _self#highlight#pick('Normal', 'fg') .
  \' guibg=' . _self#highlight#pick('Normal', 'bg')

exec 'hi! DefxCursorLine' .
  \' guibg=' . _self#highlight#pick('Visual', 'bg')
  " \' guibg=' . _self#highlight#pick('DiffAdd', 'bg')

exec 'hi! TSString gui=italic' .
  \' guibg=' . _self#highlight#pick('TSString', 'bg') .
  \' guifg=' . _self#highlight#pick('TSString', 'fg')
exec 'hi! TSCharacter gui=italic' .
  \' guibg=' . _self#highlight#pick('TSCharacter', 'bg') .
  \' guifg=' . _self#highlight#pick('TSCharacter', 'fg')
exec 'hi! TSNumber gui=italic' .
  \' guibg=' . _self#highlight#pick('TSNumber', 'bg') .
  \' guifg=' . _self#highlight#pick('TSNumber', 'fg')
exec 'hi! TSBoolean gui=italic' .
  \' guibg=' . _self#highlight#pick('TSBoolean', 'bg') .
  \' guifg=' . _self#highlight#pick('TSBoolean', 'fg')
exec 'hi! TSFloat gui=italic' .
  \' guibg=' . _self#highlight#pick('TSFloat', 'bg') .
  \' guifg=' . _self#highlight#pick('TSFloat', 'fg')
exec 'hi! TSParameter gui=italic' .
  \' guibg=' . _self#highlight#pick('TSParameter', 'bg') .
  \' guifg=' . _self#highlight#pick('TSParameter', 'fg')
" exec 'hi! @punctuation.bracket' .
"   \' guifg=' . _self#highlight#pick('Comment', 'fg') .
"   \' guibg=' . _self#highlight#pick('Comment', 'bg')
" exec 'hi! TSFuncBuiltin gui=bold' .
"   \' guibg=' . _self#highlight#pick('TSFuncBuiltin', 'bg') .
"   \' guifg=' . _self#highlight#pick('TSFuncBuiltin', 'fg')
" exec 'hi! TSFunction gui=bold' .
"   \' guibg=' . _self#highlight#pick('TSFunction', 'bg') .
"   \' guifg=' . _self#highlight#pick('TSFunction', 'fg')
" exec 'hi! TSFuncMacro gui=bold' .
"   \' guibg=' . _self#highlight#pick('TSFuncMacro', 'bg') .
"   \' guifg=' . _self#highlight#pick('TSFuncMacro', 'fg')
" exec 'hi! TSMethod gui=bold' .
"   \' guibg=' . _self#highlight#pick('TSMethod', 'bg') .
"   \' guifg=' . _self#highlight#pick('TSMethod', 'fg')
" exec 'hi! TSConstructor gui=bold' .
"   \' guibg=' . _self#highlight#pick('TSConstructor', 'bg') .
"   \' guifg=' . _self#highlight#pick('TSConstructor', 'fg')
" exec 'hi! TSTag gui=bold' .
"   \' guibg=' . _self#highlight#pick('TSTag', 'bg') .
"   \' guifg=' . _self#highlight#pick('TSTag', 'fg')
exec 'hi! TSKeyword gui=italic' .
  \' guibg=' . _self#highlight#pick('TSKeyword', 'bg') .
  \' guifg=' . _self#highlight#pick('TSKeyword', 'fg')
exec 'hi! TSInclude gui=italic' .
  \' guibg=' . _self#highlight#pick('TSInclude', 'bg') .
  \' guifg=' . _self#highlight#pick('TSInclude', 'fg')
exec 'hi! TSVariable gui=italic' .
  \' guibg=' . _self#highlight#pick('TSVariable', 'bg') .
  \' guifg=' . _self#highlight#pick('TSVariable', 'fg')
exec 'hi! TSVariableBuiltin gui=italic' .
  \' guibg=' . _self#highlight#pick('TSVariableBuiltin', 'bg') .
  \' guifg=' . _self#highlight#pick('TSVariableBuiltin', 'fg')
exec 'hi! TSTagAttribute gui=italic' .
  \' guibg=' . _self#highlight#pick('TSTagAttribute', 'bg') .
  \' guifg=' . _self#highlight#pick('TSVariableBuiltin', 'fg')

exec 'hi! DefxIconsDefaultIcon guibg=NONE guifg=#6d8086'
exec 'hi! DefxIconsNestedTreeIcon guibg=NONE' .
  \' guifg=' . _self#highlight#pick('Directory', 'fg')
exec 'hi! DefxIconsParentDirectory guibg=NONE' .
  \' guifg=' . _self#highlight#pick('Directory', 'fg')
exec 'hi! DefxIconsOpenedTreeIcon guibg=NONE' .
  \' guifg=' . _self#highlight#pick('Directory', 'fg')
exec 'hi! DefxIconsClosedTreeIcon guibg=NONE' .
  \' guifg=' . _self#highlight#pick('Directory', 'fg')
exec 'hi! DefxIconsDirectory guibg=NONE' .
  \' guifg=' . _self#highlight#pick('Directory', 'fg')
exec 'hi! DefxIconsSymlinkDirectory guibg=NONE' .
  \' guifg=' . _self#highlight#pick('Directory', 'fg')
exec 'hi! DefxIconsCopyIcon guibg=NONE' .
  \' guifg=' . _self#highlight#pick('WarningMsg', 'fg')
exec 'hi! DefxIconsMoveIcon guibg=NONE' .
  \' guifg=' . _self#highlight#pick('ErrorMsg', 'fg')
" exec 'hi! Defx_filename_directory gui=bold,italic,underline' .
exec 'hi! Defx_filename_directory gui=italic,underline' .
  \' guifg=' . _self#highlight#pick('PreProc', 'fg')

exec 'hi! CocHighlightText' .
  \' guibg=' . _self#highlight#pick('LspReferenceText', 'bg')
exec 'hi! WinBar gui=bold' .
  \' guifg=' . _self#highlight#pick('StatusLine', 'fg') .
  \' guibg=none'
exec 'hi! CocSymbolLine gui=bold' .
  \' guifg=' . _self#highlight#pick('StatusLine', 'fg') .
  \' guibg=none'
exec 'hi! LightBulbVirtualText' .
  \' guibg=' . _self#highlight#pick('CursorLine', 'bg') .
  \' guifg=' . _self#highlight#pick('Special', 'fg')
exec 'hi! CocGitSignChange' .
  \' guifg=' . _self#highlight#pick('DiffChange', 'bg') .
  \' guibg=' . _self#highlight#pick('DiffChange', 'bg')
exec 'hi! CocGitSignAdd' .
  \' guifg=' . _self#highlight#pick('DiffAdd', 'bg') .
  \' guibg=' . _self#highlight#pick('DiffAdd', 'bg')
exec 'hi! CocGitSignDelete' .
  \' guifg=' . _self#highlight#pick('DiffDelete', 'bg') .
  \' guibg=' . _self#highlight#pick('DiffDelete', 'bg')
exec 'hi! CocMenuSel' .
  \' guibg=' . _self#highlight#pick('Visual', 'bg')
  " \' guibg=' . _self#highlight#pick('DiffAdd', 'bg')
exec 'hi! WilderBorder' .
  \' guifg=' . _self#highlight#pick('Visual', 'bg') .
  \' guibg=' . _self#highlight#pick('StatusLine', 'bg')
exec 'hi! CocListLine' .
  \' guibg=' . _self#highlight#pick('Visual', 'bg')
  " \' guibg=' . _self#highlight#pick('DiffAdd', 'bg')
exec 'hi! CocFloating' .
  \' guibg=' . _self#highlight#pick('StatusLine', 'bg')
exec 'hi! CocFloatDividingLine' .
  \' guibg=' . _self#highlight#pick('StatusLine', 'bg')

exec 'hi! CocErrorVirtualText' .
  \' guifg=' . _self#highlight#pick('CocErrorFloat', 'fg') .
  \' guibg=' . _self#highlight#darken('CocErrorFloat', 'fg')
exec 'hi! CocWarningVirtualText' .
  \' guifg=' . _self#highlight#pick('CocWarningFloat', 'fg') .
  \' guibg=' . _self#highlight#darken('CocWarningFloat', 'fg')
exec 'hi! CocInfoVirtualText' .
  \' guifg=' . _self#highlight#pick('CocInfoFloat', 'fg') .
  \' guibg=' . _self#highlight#darken('CocInfoFloat', 'fg')
exec 'hi! CocHintVirtualText' .
  \' guifg=' . _self#highlight#pick('CocHintFloat', 'fg') .
  \' guibg=' . _self#highlight#darken('CocHintFloat', 'fg')

exec 'hi! DiagnosticError' .
  \' guifg=' . _self#highlight#pick('CocErrorVirtualText', 'fg') .
  \' guibg=' . _self#highlight#darken('StatusLine', 'bg')
exec 'hi! DiagnosticWarn' .
  \' guifg=' . _self#highlight#pick('CocWarningVirtualText', 'fg') .
  \' guibg=' . _self#highlight#darken('StatusLine', 'bg')
exec 'hi! DiagnosticInfo' .
  \' guifg=' . _self#highlight#pick('CocInfoVirtualText', 'fg') .
  \' guibg=' . _self#highlight#darken('StatusLine', 'bg')
exec 'hi! DiagnosticHint' .
  \' guifg=' . _self#highlight#pick('CocHintVirtualText', 'fg') .
  \' guibg=' . _self#highlight#darken('StatusLine', 'bg')

autocmd VimEnter * exec 'hi! IndentBlanklineContextStart gui=none' .
  \' guifg=' . _self#highlight#pick('IndentBlanklineContextStart', 'fg') .
  \' guibg=' . _self#highlight#pick('IndentBlanklineContextStart', 'bg')
autocmd VimEnter * exec 'hi! IndentBlanklineIndent guifg=#393734 gui=nocombine'
autocmd VimEnter * exec 'hi! IndentBlanklineContextChar guifg=#554f49 gui=nocombine'

autocmd VimEnter * exec 'hi! link @punctuation.bracket Comment'

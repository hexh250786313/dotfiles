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

let g:defaultnormalgb=_self#highlight#pick('Normal', 'bg')

" 全局 Normal 不能设置 gui, 但是 winhighlight 可以
" 不透明
let g:hlnormalstate=1
set cursorline

" 透明
" let g:hlnormalstate=0
" hi! Normal guibg=NONE
" set nocursorline

let s:green = '#b8bb26'
let s:blue = '#83a598'
let s:red = '#fb4934'
let s:green_bg = '#32361a'
let s:blue_bg = '#0d3138'
let s:red_bg = '#3c1f1e'

let s:error = _self#highlight#pick('ErrorMsg', 'fg')
let s:error_bg = _self#highlight#darken('ErrorMsg', 'fg')
let s:warning = _self#highlight#pick('WarningMsg', 'fg')
let s:warning_bg = _self#highlight#darken('WarningMsg', 'fg')
let s:info = _self#highlight#pick('Directory', 'fg')
let s:info_bg = _self#highlight#darken('Directory', 'fg')
let s:hint = _self#highlight#pick('Directory', 'fg')
let s:hint_bg = _self#highlight#darken('Directory', 'fg')

" autocmd VimEnter * exec 'hi! IndentBlanklineContextStart gui=none' .
"   \' guifg=' . _self#highlight#pick('IndentBlanklineContextStart', 'fg') .
"   \' guibg=' . _self#highlight#pick('IndentBlanklineContextStart', 'bg')
" autocmd VimEnter * exec 'hi! IndentBlanklineIndent guifg=#393734 gui=nocombine'
" autocmd VimEnter * exec 'hi! IndentBlanklineContextChar guifg=#554f49 gui=nocombine'
hi! IndentBlanklineIndent guifg=#393734 gui=nocombine
hi! IndentBlanklineContextChar guifg=#554f49 gui=nocombine

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

exec 'hi! DiffAdd guibg=' . s:green_bg . ' guifg=NONE'
exec 'hi! DiffChange guibg=' . s:blue_bg . ' guifg=NONE'
exec 'hi! DiffDelete guibg=' . s:red_bg . ' guifg=NONE'
exec 'hi! @text.diff.add guibg=NONE guifg=' . s:green
exec 'hi! @text.diff.delete guibg=NONE guifg=' . s:red
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

exec 'hi! Comment gui=italic' .
  \' guifg=' . _self#highlight#pick('Comment', 'fg') .
  \' guibg=' . _self#highlight#pick('Comment', 'bg')
exec 'hi! @string gui=italic' .
  \' guibg=' . _self#highlight#pick('@string', 'bg') .
  \' guifg=' . _self#highlight#pick('@string', 'fg')
exec 'hi! @character gui=italic' .
  \' guibg=' . _self#highlight#pick('@character', 'bg') .
  \' guifg=' . _self#highlight#pick('@character', 'fg')
exec 'hi! @number gui=italic' .
  \' guibg=' . _self#highlight#pick('@number', 'bg') .
  \' guifg=' . _self#highlight#pick('@number', 'fg')
exec 'hi! @boolean gui=italic' .
  \' guibg=' . _self#highlight#pick('@boolean', 'bg') .
  \' guifg=' . _self#highlight#pick('@boolean', 'fg')
exec 'hi! @float gui=italic' .
  \' guibg=' . _self#highlight#pick('@float', 'bg') .
  \' guifg=' . _self#highlight#pick('@float', 'fg')
exec 'hi! @parameter gui=italic' .
  \' guibg=' . _self#highlight#pick('@parameter', 'bg') .
  \' guifg=' . _self#highlight#pick('@parameter', 'fg')
exec 'hi! @punctuation.bracket gui=italic' .
  \' guifg=' . _self#highlight#pick('Normal', 'fg') .
  \' guibg=NONE'
" exec 'hi! @function.builtin gui=bold' .
"   \' guibg=' . _self#highlight#pick('@function.builtin', 'bg') .
"   \' guifg=' . _self#highlight#pick('@function.builtin', 'fg')
" exec 'hi! @function gui=bold' .
"   \' guibg=' . _self#highlight#pick('@function', 'bg') .
"   \' guifg=' . _self#highlight#pick('@function', 'fg')
" exec 'hi! @function.macro gui=bold' .
"   \' guibg=' . _self#highlight#pick('@function.macro', 'bg') .
"   \' guifg=' . _self#highlight#pick('@function.macro', 'fg')
" exec 'hi! @method gui=bold' .
"   \' guibg=' . _self#highlight#pick('@method', 'bg') .
"   \' guifg=' . _self#highlight#pick('@method', 'fg')
" exec 'hi! @constructor gui=bold' .
"   \' guibg=' . _self#highlight#pick('@constructor', 'bg') .
"   \' guifg=' . _self#highlight#pick('@constructor', 'fg')
" exec 'hi! @tag gui=bold' .
"   \' guibg=' . _self#highlight#pick('@tag', 'bg') .
"   \' guifg=' . _self#highlight#pick('@tag', 'fg')
exec 'hi! @keyword gui=italic' .
  \' guibg=' . _self#highlight#pick('@keyword', 'bg') .
  \' guifg=' . _self#highlight#pick('@keyword', 'fg')
exec 'hi! @include gui=italic' .
  \' guibg=' . _self#highlight#pick('@include', 'bg') .
  \' guifg=' . _self#highlight#pick('@include', 'fg')
exec 'hi! @variable gui=italic' .
  \' guibg=' . _self#highlight#pick('@variable', 'bg') .
  \' guifg=' . _self#highlight#pick('@variable', 'fg')
exec 'hi! @variable.builtin gui=italic' .
  \' guibg=' . _self#highlight#pick('@variable.builtin', 'bg') .
  \' guifg=' . _self#highlight#pick('@variable.builtin', 'fg')
exec 'hi! @tag.attribute gui=italic' .
  \' guibg=' . _self#highlight#pick('@tag.attribute', 'bg') .
  \' guifg=' . _self#highlight#pick('@variable.builtin', 'fg')

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

exec 'hi! DiagnosticError' .
  \' guifg=' . s:error .
  \' guibg=' . _self#highlight#pick('DiagnosticError', 'bg')
exec 'hi! DiagnosticWarn' .
  \' guifg=' . s:warning .
  \' guibg=' . _self#highlight#pick('DiagnosticWarn', 'bg')
exec 'hi! DiagnosticInfo' .
  \' guifg=' . s:info .
  \' guibg=' . _self#highlight#pick('DiagnosticInfo', 'bg')
exec 'hi! DiagnosticHint' .
  \' guifg=' . s:hint .
  \' guibg=' . _self#highlight#pick('DiagnosticHint', 'bg')

exec 'hi! CocErrorVirtualText' .
  \' guifg=' . s:error .
  \' guibg=' . s:error_bg
exec 'hi! CocWarningVirtualText' .
  \' guifg=' . s:warning .
  \' guibg=' . s:warning_bg
exec 'hi! CocInfoVirtualText' .
  \' guifg=' . s:info .
  \' guibg=' . s:info_bg
exec 'hi! CocHintVirtualText' .
  \' guifg=' . s:hint .
  \' guibg=' . s:hint_bg

exec 'hi! CocErrorSign' .
  \' guifg=' . s:error .
  \' guibg=NONE'
exec 'hi! CocWarningSign' .
  \' guifg=' . s:warning .
  \' guibg=NONE'
exec 'hi! CocInfoSign' .
  \' guifg=' . s:info .
  \' guibg=NONE'
exec 'hi! CocHintSign' .
  \' guifg=' . s:hint .
  \' guibg=NONE'

exec 'hi! CocGitSignChange guifg=' . s:blue . ' guibg=NONE'
exec 'hi! CocGitSignDelete guifg=' . s:red . ' guibg=NONE'
exec 'hi! CocGitSignAdd guifg=' s:green . ' guibg=NONE'

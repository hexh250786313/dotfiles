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
let g:gruvbox_material_foreground = 'original'

colorscheme catppuccin

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
" exec 'hi! @punctuation.bracket' .
"   \' guifg=' . _self#highlight#pick('Comment', 'fg') .
"   \' guibg=' . _self#highlight#pick('Comment', 'bg')
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

function _self#highlight#toggle_normal_background()
  if g:hlnormalstate == 1
    let g:hlnormalstate=0
    hi! Normal guibg=NONE
    exec 'hi! NormalStrongFont gui=bold' .
      \' guifg=' . _self#highlight#pick('Normal', 'fg') .
      \' guibg=' . _self#highlight#pick('Normal', 'bg')
  else
    let g:hlnormalstate=1
    exec 'hi! Normal' .
      \' guibg=' . g:defaultnormalgb
    exec 'hi! NormalStrongFont gui=bold' .
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

if &background == "dark"
  let s:green = '#b8bb26'
  let s:blue = '#83a598'
  let s:red = '#fb4934'
  let s:green_bg = '#32361a'
  let s:blue_bg = '#0d3138'
  let s:red_bg = '#3c1f1e'
else
  let s:green = '#C7DDC5'
  let s:blue = '#99CCFF'
  let s:red = '#E7BCC8'
  let s:green_bg = '#D5E5D6'
  let s:blue_bg = '#E0E6F8'
  let s:red_bg = '#EACFD8'
endif

let s:error = _self#highlight#pick('ErrorMsg', 'fg')
let s:error_bg = _self#highlight#darken('ErrorMsg', 'fg')
let s:warning = _self#highlight#pick('WarningMsg', 'fg')
let s:warning_bg = _self#highlight#darken('WarningMsg', 'fg')
let s:info = _self#highlight#pick('Directory', 'fg')
let s:info_bg = _self#highlight#darken('Directory', 'fg')
let s:hint = _self#highlight#pick('Directory', 'fg')
let s:hint_bg = _self#highlight#darken('Directory', 'fg')

hi! LineNr guibg=NONE
hi! SignColumn guibg=NONE
hi! EndOfBuffer guibg=NONE

hi! link CocFloating Normal
hi! link CocFloatDividingLine Normal
hi! link CocListPath StatusLine
hi! link CocListMode StatusLine
hi! link CocSearch Question
hi! link CocPumMenu Pmenu
hi! link NormalNC Normal
hi! link CopilotSuggestion DefxIconsDefaultIcon
hi! link CocUnusedHighlight DiagnosticUnnecessary

" hi! CursorWord gui=underline
if &background == "dark"
  hi! CursorWord guibg=#303731
else
  hi! CursorWord guibg=#D3D3D3
endif

exec 'hi! DiffAdd guibg=' . s:green_bg . ' guifg=NONE'
exec 'hi! DiffChange guibg=' . s:blue_bg . ' guifg=NONE'
exec 'hi! DiffDelete guibg=' . s:red_bg . ' guifg=NONE'
exec 'hi! @text.diff.add guibg=NONE guifg=' . s:green
exec 'hi! @text.diff.delete guibg=NONE guifg=' . s:red
if &background == "dark"
  exec 'hi! DiffText' .
    \' guifg=none' .
    \' guibg=' . _self#highlight#darken('DiffChange', 'bg')
else
  exec 'hi! DiffText' .
    \' guifg=none' .
    \' guibg=' . s:blue
endif
exec 'hi! VirtColumn' .
  \' guifg=' . _self#highlight#pick('DiffChange', 'bg')
exec 'hi SpellBad guifg=' . s:error .
  \' guibg=' . _self#highlight#pick('SpellBad', 'bg')
exec 'hi! NormalStrongFont' .
  \' guifg=' . _self#highlight#pick('Normal', 'fg') .
  \' guibg=' . _self#highlight#pick('Normal', 'bg')

exec 'hi! DefxCursorLine' .
  \' guibg=' . _self#highlight#pick('Visual', 'bg')

exec 'hi! @punctuation.bracket' .
  \' guifg=' . _self#highlight#pick('Normal', 'fg') .
  \' guibg=NONE'
exec 'hi! @tag.attribute' .
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
exec 'hi! Defx_filename_directory gui=italic' .
  \' guifg=' . _self#highlight#pick('WarningMsg', 'fg')
  " \' guifg=' . _self#highlight#pick('PreProc', 'fg')
exec 'hi! WinSeparator' .
  \' guifg=' . _self#highlight#pick('CursorLine', 'bg')
exec 'hi! WinBar gui=bold' .
  \' guifg=' . _self#highlight#pick('StatusLine', 'fg') .
  \' guibg=' . _self#highlight#pick('StatusLine', 'bg')

exec 'hi! CocHighlightText' .
  \' guibg=' . _self#highlight#pick('LspReferenceText', 'bg')
exec 'hi! LightBulbVirtualText' .
  \' guibg=' . _self#highlight#pick('CursorLine', 'bg') .
  \' guifg=' . _self#highlight#pick('Special', 'fg')
exec 'hi! CocMenuSel gui=bold' .
  \' guibg=' . _self#highlight#pick('PmenuSel', 'bg')
  " \' guibg=' . _self#highlight#pick('DiffAdd', 'bg')
exec 'hi! WilderBorder' .
  \' guifg=' . _self#highlight#pick('Visual', 'bg') .
  \' guibg=' . _self#highlight#pick('StatusLine', 'bg')
exec 'hi! CocListLine' .
  \' guibg=' . _self#highlight#pick('Visual', 'bg')
  " \' guibg=' . _self#highlight#pick('DiffAdd', 'bg')
exec 'hi! CocFloating' .
  \' guibg=' . _self#highlight#pick('StatusLine', 'bg')
" exec 'hi! CocFloatDividingLine' .
"   \' guibg=' . _self#highlight#pick('StatusLine', 'bg')
exec 'hi! CocPumShortcut' .
  \' guibg=' . _self#highlight#pick('Comment', 'bg')
  \' guifg=' . _self#highlight#pick('Comment', 'fg')

autocmd VimEnter * exec 'hi! CocSymbolLine gui=italic' .
  \' guibg=' . _self#highlight#pick('lualine_c_normal', 'bg') .
  \' guifg=' . _self#highlight#pick('lualine_c_normal', 'fg')

if &background == "dark"
  autocmd VimEnter * exec 'hi! CocInlayHint' .
    \' guibg=none' .
    \' guifg=#393939'
else
  autocmd VimEnter * exec 'hi! CocInlayHint' .
    \' guibg=none' .
    \' guifg=#D0D0D0'
endif

if &background == "dark"
  exec 'hi! Folded' .
    \' guibg=#171821' .
    \' guifg=none'
else
  exec 'hi! Folded' .
    \' guibg=#a8b1ba' .
    \' guifg=none'
endif

" exec 'hi! UfoFoldedBg' .
"   \' guibg=none' .
"   \' guifg=none'

" exec 'hi! UfoCursorFoldedLine' .
"   \' guibg=' . _self#highlight#pick('DiffChange', 'bg') .
"   \' guifg=' . _self#highlight#pick('DiffChange', 'bg')
" autocmd VimEnter * exec 'hi! UfoFoldedEllipsis' .
"   \' guibg=' . _self#highlight#pick('Folded', 'bg') .
"   \' guifg=' . _self#highlight#pick('CocInlayHint', 'fg')

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

if &background == "dark"
  hi! PrettyTsErrorType guifg=#393939 guibg=NONE gui=NONE
else
  hi! PrettyTsErrorType guifg=#D0D0D0  guibg=NONE gui=NONE
endif

" 插入模式的时候让上述 coc 相关的 VirtualText 变为不可视，正常模式下恢复，其实就是变为 CursorLine 的背景一个颜色
autocmd InsertEnter * exec 'hi! CocErrorVirtualText guibg=NONE' .
  \' guifg=' . _self#highlight#pick('CursorLine', 'bg')
autocmd InsertEnter * exec 'hi! CocWarningVirtualText guibg=NONE' .
  \' guifg=' . _self#highlight#pick('CursorLine', 'bg')
autocmd InsertEnter * exec 'hi! CocInfoVirtualText guibg=NONE' .
  \' guifg=' . _self#highlight#pick('CursorLine', 'bg')
autocmd InsertEnter * exec 'hi! CocHintVirtualText guibg=NONE' .
  \' guifg=' . _self#highlight#pick('CursorLine', 'bg')
autocmd InsertLeave * exec 'hi! CocErrorVirtualText guifg=' . s:error . ' guibg=' . s:error_bg
autocmd InsertLeave * exec 'hi! CocWarningVirtualText guifg=' . s:warning . ' guibg=' . s:warning_bg
autocmd InsertLeave * exec 'hi! CocInfoVirtualText guifg=' . s:info . ' guibg=' . s:info_bg
autocmd InsertLeave * exec 'hi! CocHintVirtualText guifg=' . s:hint . ' guibg=' . s:hint_bg

exec 'hi! CocErrorSign gui=bold,Italic' .
  \' guifg=' . s:error .
  \' guibg=NONE'
exec 'hi! CocWarningSign gui=bold,Italic' .
  \' guifg=' . s:warning .
  \' guibg=NONE'
exec 'hi! CocInfoSign gui=bold,Italic' .
  \' guifg=' . s:info .
  \' guibg=NONE'
exec 'hi! CocHintSign gui=bold,Italic' .
  \' guifg=' . s:hint .
  \' guibg=NONE'

exec 'hi! CocGitSignChange guifg=' . s:blue_bg . ' guibg=NONE'
exec 'hi! CocGitSignDelete guifg=' . s:red_bg . ' guibg=NONE'
exec 'hi! CocGitSignAdd guifg=' s:green_bg . ' guibg=NONE'


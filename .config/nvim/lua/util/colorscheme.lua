vim.cmd(
  [[
" 这种方式和 link 不同, 可以单独设置 gui / guibg / guifg, 但是确无法像 link 同步修改, 也就是只能初始化
function! HandleColorNONE(color)
  if a:color != ''
    return a:color
  else
    return "NONE"
  end
endfunction

function ToggleNormalBackground()
  if g:hlnormalstate == 1
    let g:hlnormalstate=0
    hi! Normal guibg=NONE
    exec 'hi! NormalStrongFont gui=italic,bold' .
      \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')) .
      \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui'))
  else
    let g:hlnormalstate=1
    exec 'hi! Normal' .
      \' guibg=' . g:defaultnormalgb
    exec 'hi! NormalStrongFont gui=italic,bold' .
      \' guifg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'fg', 'gui')) .
      \' guibg=' . HandleColorNONE(synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui'))
  endif
endfunction

function ToggleCursorLine()
  echo &cursorline
  if &cursorline == 1
    set nocursorline
  else
    set cursorline
  endif
endfunction

" 把颜色明度变为 19%, 相当于变暗处理
function Darken (color)
  if a:color != ''
    let l:hsl = ConvertColorTo('hsl', a:color)
    " let l:bright = matchstr(l:hsl, '\v, \zs(\d*)\ze\%\)') " {{TEXT}}\zs{{MATCH}} -- 前面为{{TEXT}}的{{MATCH}} ; {{MATCT}}\ze{{TEXT}} -- 后面为{{TEXT}}的{{MATCH}} ; \v: 魔法字符 :help magic
    let l:bright = match(l:hsl, '\v, \zs(\d*)\ze\%\)') " {{TEXT}}\zs{{MATCH}} -- 前面为{{TEXT}}的{{MATCH}} ; {{MATCT}}\ze{{TEXT}} -- 后面为{{TEXT}}的{{MATCH}} ; \v: 魔法字符 :help magic
    let l:nextHsl = substitute(l:hsl, '\v, \zs(\d*)\ze\%\)', '19', 'g') " Converted hsl(42, 95%, 58%) -> hsl(42, 95%, 19%)
    if l:nextHsl != -1
      return ConvertColorTo('hex', l:nextHsl)
    else
      return a:color
    end
  else
    return "NONE"
  end
endfunction
]]
)

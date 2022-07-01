vim.cmd(
  [[
" xsel -i -b 可以跨 vmware, 原理不明, nvim 自己的复制用的是 xclip, 无法跨 vmware
function! ClipboardYank(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  call system("echo -n '" . word . "' | xsel -i -b") " -n for not including newline, i.e. \n
endfunction
]]
)

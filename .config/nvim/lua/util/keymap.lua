vim.cmd(
  [[
" xsel -i -b 可以跨 vmware, 原理不明, nvim 自己的复制用的是 xclip, 无法跨 vmware
function! ClipboardYank(type)
  let saved_unnamed_register = @@
  " echo "--" . a:type . "\n"
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'V'
    normal! `<V`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  " echo @@
  let word1 = substitute(@@, '\n$', '', 'g')
  " let word = escape(word, '| ') " escape ' ' to '\ '
  let word2 = substitute(word1, "\\'", "'\\\\''", 'g') " For shell "echo" command: ' to '\'' --- Example: [echo 'It's me'] should be [echo 'It'\''s me']
  let word = word2
  let @@ = saved_unnamed_register
  call system("echo -n '" . word . "' | xsel -i -b") " -n for not including newline, i.e. \n
endfunction
]]
)

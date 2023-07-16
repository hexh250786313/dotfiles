" 复制代码到剪贴板
function! _self#yank#copy_to_clipboard(type) abort
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'V'
    normal! `<V`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word1 = substitute(@@, '\\', '\\\\', 'g')
  let word2 = substitute(word1, "\\'", "'\\\\''", 'g')
  let word = word2
  let @@ = saved_unnamed_register
  call system("echo -n '" . word . "' | xsel --input -b")
  normal! gv
endfunction

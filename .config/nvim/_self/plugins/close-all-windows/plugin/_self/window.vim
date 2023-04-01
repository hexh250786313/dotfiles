" 关闭除了自己以外的 buffer
function! _self#window#close_all_windows() abort
  if confirm('Close all other windows?', "&Yes\n&No\n&Cancel") == 1
    only
  endif
endfunction

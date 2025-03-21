" 删除除了自己以外的 buffer
function! _self#buffer#delete_all_buffers() abort
    let curr_buf = bufnr('%')
    let last_buf = bufnr('$')

    let delete_count = 0
    let n = 1
    while n <= last_buf
        if n != curr_buf && buflisted(n)
            if getbufvar(n, '&modified')
                echohl ErrorMsg
                echomsg 'No write since last change for buffer ' . n
                echohl None
            else
                silent exe 'bdel ' . n
                let delete_count += 1
            endif
        endif
        let n += 1
    endwhile
    
    echo delete_count . ' buffer(s) deleted'
  " if confirm('Kill all other buffers?', "&Yes\n&No\n&Cancel") == 1
  "   let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val)')
  "   for i in blisted
  "     if i != bufnr('%')
  "       try
  "         exe 'bw ' . i
  "       catch
  "       endtry
  "     endif
  "   endfor
  " endif
endfunction

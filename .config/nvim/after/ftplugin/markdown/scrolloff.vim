function! s:SetScrolloff()
  let current_file_type = &filetype
  if current_file_type == 'markdown'
    setlocal scrolloff=999
    setlocal nowrap
    return
  else
    setlocal scrolloff=0
  endif
endfunction

augroup set_md_scrolloff
  autocmd!
  autocmd BufEnter * :call <SID>SetScrolloff()
augroup END

nnoremap <silent><buffer> <ScrollWheelUp> k
nnoremap <silent><buffer> <ScrollWheelDown> j

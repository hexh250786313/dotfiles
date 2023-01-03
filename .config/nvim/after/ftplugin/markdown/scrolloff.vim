let s:scrolloff = &scrolloff

function! s:SetScrolloff()
  let current_file_type = &filetype
  if current_file_type ==# 'markdown'
    set scrolloff=999
    setlocal nowrap
  elseif current_file_type ==# 'defx'
    set scrolloff=3
  else
    let &scrolloff=s:scrolloff
  endif
endfunction

augroup set_md_scrolloff
  autocmd!
augroup END

augroup set_md_scrolloff
  autocmd!
  autocmd BufEnter * :call <SID>SetScrolloff()
augroup END

nnoremap <silent><buffer> <ScrollWheelUp> k
nnoremap <silent><buffer> <ScrollWheelDown> j

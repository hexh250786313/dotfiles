" 避免 buffer 切换时 vim 自动滚动页面让 cursor 居中
" https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers

" Save current view settings on a per-window, per-buffer basis.
function! s:AUTO_SAVE_WIN_VIEW()
  if !exists("w:SavedBufView")
    let w:SavedBufView = {}
  endif
  let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! s:AUTO_RESTORE_WIN_VIEW()
  let buf = bufnr("%")
  if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
    let v = winsaveview()
    let atStartOfFile = v.lnum == 1 && v.col == 0
    if atStartOfFile && !&diff
      call winrestview(w:SavedBufView[buf])
    endif
    unlet w:SavedBufView[buf]
  endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
  autocmd BufLeave * call <SID>AUTO_SAVE_WIN_VIEW()
  autocmd BufEnter * call <SID>AUTO_RESTORE_WIN_VIEW()
endif

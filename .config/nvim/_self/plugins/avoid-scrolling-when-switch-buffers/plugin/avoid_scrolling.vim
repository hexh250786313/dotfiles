" 避免 buffer 切换时 vim 自动滚动页面让 cursor 居中
" https://stackoverflow.com/questions/18048944/vim-put-cursor-in-the-middle-of-screen-after-buffer-switch
if v:version >= 700
  au BufLeave * if !&diff | let b:winview = winsaveview() | endif
  au BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | endif
endif

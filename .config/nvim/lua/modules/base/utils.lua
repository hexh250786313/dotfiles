vim.cmd(
  [[
" 获取识别码
function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" 添加全局识别码
let g:base_config_sid = s:SID_PREFIX()

" 编译 nvim
function! s:COMPILE()
  :execute "!sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/all.sh"
  :PackerCompile
  :call timer_start(2000, { -> <SID>exit() })
endfunction

function! s:exit()
  :qa
endfunction
]]
)

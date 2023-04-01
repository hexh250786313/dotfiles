function! s:TOGGLE_TERM_WATCH(opts)
  lua require("modules.base.plugins.toggleterm").watch_term(vim.fn.eval("a:opts"))
endfunction

function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" 添加全局识别码
let g:asyncrun_runner_watch_config_sid = s:SID_PREFIX()
let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.watch = function(g:asyncrun_runner_watch_config_sid . 'TOGGLE_TERM_WATCH')

function! s:TOGGLE_TERM_EXEC(opts)
  " echomsg json_encode(json_decode(a:opts.option))
  let l:termnr = 2
  if exists("a:opts.option")
    if stridx(a:opts.option, "termnr") != -1
      let l:next_termnr = json_decode(a:opts.option).termnr
      let l:termnr = l:next_termnr
    endif
  endif
  let g:floating_termnr = l:termnr
  exec l:termnr . "TermExec cmd='". a:opts.cmd . "' dir='" . a:opts.cwd . "'" . " go_back=0"
endfunction

" 获取识别码
function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" 添加全局识别码
let g:asyncrun_runner_exec_config_sid = s:SID_PREFIX()
let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.exec = function(g:asyncrun_runner_exec_config_sid . 'TOGGLE_TERM_EXEC')

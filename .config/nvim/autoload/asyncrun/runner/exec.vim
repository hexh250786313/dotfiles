function! ToggleTermExec(opts)
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

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.exec = function('ToggleTermExec')

function! ToggleTermWatch(opts)
  lua require("modules.base.plugins.toggleterm").watch_term(vim.fn.eval("a:opts"))
endfunction

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.watch = function('ToggleTermWatch')

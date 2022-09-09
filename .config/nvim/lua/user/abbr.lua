vim.cmd(
  [[
iabbr cosnt const
iabbr thsi this
iabbr mian main
iabbr gril girl
iabbr ture true

" Refer: https://github.com/chemzqm/vimrc/blob/master/abbr.vim
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call SetupCommandAbbrs('ch', 'checkhealth')
call SetupCommandAbbrs('cl', 'CocList')
call SetupCommandAbbrs('cr', 'CocRestart')
call SetupCommandAbbrs('pu', 'PackerUpdate')
call SetupCommandAbbrs('pc', 'PackerCompile')
call SetupCommandAbbrs('cu', 'CocUpdate')
call SetupCommandAbbrs('tu', 'TSUpdate')
]]
)

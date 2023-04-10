vim.cmd([[
iabbr cosnt const
iabbr thsi this
iabbr mian main
iabbr gril girl
iabbr ture true

" Refer: https://github.com/chemzqm/vimrc/blob/master/abbr.vim
function! s:SETUP_COMMAND_ABBRS(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call <SID>SETUP_COMMAND_ABBRS('ch',  'checkhealth')
call <SID>SETUP_COMMAND_ABBRS('cl',  'CocList')
call <SID>SETUP_COMMAND_ABBRS('cr',  'CocRestart')
call <SID>SETUP_COMMAND_ABBRS('pu',  'PackerUpdate')
call <SID>SETUP_COMMAND_ABBRS('pc',  'call ' . g:base_config_sid . 'COMPILE()')
call <SID>SETUP_COMMAND_ABBRS('cu',  'CocUpdate')
call <SID>SETUP_COMMAND_ABBRS('tu',  'TSUpdate')
call <SID>SETUP_COMMAND_ABBRS('ol',  'CocOutline')
call <SID>SETUP_COMMAND_ABBRS('tt',  'CocCommand coc-todo-tree.showTree')
call <SID>SETUP_COMMAND_ABBRS('gb',  'Git blame')
call <SID>SETUP_COMMAND_ABBRS('git', 'Git')
call <SID>SETUP_COMMAND_ABBRS('cm',  'CocCommand markdown-preview-enhanced.openPreview')
call <SID>SETUP_COMMAND_ABBRS('ex',  'Explore')
call <SID>SETUP_COMMAND_ABBRS('dc',  'DiffviewClose')
call <SID>SETUP_COMMAND_ABBRS('cs',  'ConfigSource')
]])

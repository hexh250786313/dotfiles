---------> 快捷键
local wk = require("which-key")
wk.register(
  {
    ["<leader>e"] = {"<cmd>exec 'call ' . g:defx_config_sid . 'DEFX_OPEN(0)'<cr>", "Open file explorer"},
    ["<leader>E"] = {
      "<cmd>exec 'call ' . g:defx_config_sid . 'DEFX_OPEN(1)'<cr>",
      "Search current file at file explorer"
    }
  }
)

---------> 配置
-- 要放外层这里才生效，原因不明
vim.g.defx_icons_column_length = 2
vim.cmd(
  [[
call defx#custom#column('filename', {
  \    'min_width': 300,
  \  })
call defx#custom#column('indent', {
  \    'indent': '  ',
  \  })
call defx#custom#column('icon', {
  \    'directory_icon': '  ',
  \    'opened_icon': '  ',
  \    'file_icon': '   ',
  \    'root_icon': '',
  \  })
call defx#custom#option('_', {
  \    'show_ignored_files': 0,
  \    'listed': 1,
  \    'columns': 'mark:git:indent:icon:icons:filename',
  \    'split': 'no',
  \    'vertical_preview': 1,
  \    'winwidth': 300,
  \    'resume': 1,
  \  })


" 获取识别码
function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" 从 str 中删除 trim
function! s:TRIM_RIGHT(str, trim) abort
  return substitute(a:str, printf('%s$', a:trim), '', 'g')
endfunction

" 打开 Defx
function! s:DEFX_OPEN(search) abort
  let l:str = ''
  if a:search == 1
    let l:str = " -search-recursive=`expand('%:p')` "
  endif
  exec 'Defx `getcwd()` -wincol=`&columns/9` -preview-width=`&columns/2` -winrow=`&lines/9` -winheight=`&lines/2` -preview_height=`&lines/1`' . l:str
endfunction

" 打开目录 or 打开文件
function! s:DEFX_SMART_L(_) abort
  if defx#is_directory()
    call defx#call_action('open_or_close_tree')
  elseif defx#is_binary()
    silent exec '!explorer.exe `wslpath -w "' .. filepath .. '"`'
  else
    let filepath = defx#get_candidate()['action__path']
      try
        exec 'b#'
        let current_file_path = expand('%:p')
        if current_file_path != filepath
          exec 'e' filepath
        endif
      catch
        call defx#call_action('multi', ['drop', 'quit'])
      endtry
  endif
endfunction

" wsl 资源管理器打开
function! s:OPEN_AT_WSL_EXPLORER(_)
  let filepath = defx#get_candidate()['action__path']
  if defx#is_directory()
    silent exec '!explorer.exe `wslpath -w "' .. filepath .. '"`'
  elseif defx#is_binary()
    silent exec '!explorer.exe `wslpath -w "' .. filepath .. '"`'
  else
    call <SID>DEFX_SMART_L("")
  endif
endfunction

" 收回目录 or 打开上一页
function! s:DEFX_TOGGLE_TREE_LEFT(_) abort
  " if cursor line is first line, or in empty dir
  if line('.') ==# 1 || line('$') ==# 1
    return defx#call_action('cd', ['..'])
  endif

  " candidate is opend tree?
  if defx#is_opened_tree()
    return defx#call_action('close_tree')
  endif

  " parent is root?
  let s:candidate = defx#get_candidate()
  let s:parent = fnamemodify(s:candidate['action__path'], s:candidate['is_directory'] ? ':p:h:h' : ':p:h')
  if s:TRIM_RIGHT(s:parent, '/') == s:TRIM_RIGHT(b:defx.paths[0], '/')
    return defx#call_action('cd', ['..'])
  endif

  " move to parent.
  call defx#call_action('search', s:parent)

  " if you want close_tree immediately, enable below line.
  call defx#call_action('close_tree')
endfunction

" cd
function s:CD_AND_CLOSE () abort
  let s:candidate = defx#get_candidate()
  let s:current = fnamemodify(s:candidate['action__path'], ':p:h')
  execute 'lcd ' . s:current
  " call <SID>DEFX_OPEN(0)
  echomsg 'cd ' . s:current
  call defx#call_action('quit')
endfunction

" cd 根目录
function s:CD_ROOT_AND_CLOSE () abort
  " 获取 git 仓库根目录
  let result = system('git rev-parse --show-toplevel')
  let l:root = '.'
  if v:shell_error == 0
    let l:root = substitute(result, '\n*$', '', 'g')
  endif
  if root != '.'
    " 执行 lcd 只改变当前 buffer 的工作目录
    execute 'lcd ' . root
    " call <SID>DEFX_OPEN(0)
    echomsg 'cd ' . root
    call defx#call_action('quit')
  endif
endfunction

" 添加全局 defx 识别码
let g:defx_config_sid = s:SID_PREFIX()

" 注册 Defx 配置，每个 Vim 实例只执行一次
function! s:DEFX_MY_SETTINGS() abort
  setlocal nowrap
  setlocal cursorline
  " setlocal nornu
  " setlocal nonu
  setlocal shiftwidth=2

  " 默认配置
  nnoremap <silent><buffer><expr> <CR>  defx#do_action('open')
  nnoremap <silent><buffer><expr> c     defx#do_action('copy')
  nnoremap <silent><buffer><expr> m     defx#do_action('move')
  nnoremap <silent><buffer><expr> p     defx#do_action('paste')
  nnoremap <silent><buffer><expr> E     defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P     defx#do_action('preview')
  nnoremap <silent><buffer><expr> o     defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> S     defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d     defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> r     defx#do_action('rename')
  nnoremap <silent><buffer><expr> !     defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;     defx#do_action('repeat')
  nnoremap <silent><buffer><expr> ~     defx#do_action('cd')
  nnoremap <silent><buffer><expr> q     defx#do_action('quit')
  nnoremap <silent><buffer><expr> <tab> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *     defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j     line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k     line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd    defx#do_action('change_vim_cwd')
  " nnoremap <silent><buffer><expr> l     defx#do_action('open')
  " nnoremap <silent><buffer><expr> N     defx#do_action('new_file')
  " nnoremap <silent><buffer><expr> M     defx#do_action('new_multiple_files')
  " nnoremap <silent><buffer><expr> C     defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  " nnoremap <silent><buffer><expr> h     defx#do_action('cd', ['..'])

  " 我的映射
  nnoremap <silent><buffer><expr> d             defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> D             defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> <CR>          defx#do_action('call', g:defx_config_sid . 'DEFX_SMART_L')
  nnoremap <silent><buffer><expr> <2-LeftMouse> defx#do_action('call', g:defx_config_sid . 'DEFX_SMART_L')
  nnoremap <silent><buffer><expr> o             defx#do_action('call', g:defx_config_sid . 'DEFX_SMART_L')
  nnoremap <silent><buffer><expr> -             defx#do_action('call', g:defx_config_sid . 'DEFX_TOGGLE_TREE_LEFT')
  nnoremap <silent><buffer><expr> <C-n>         defx#do_action('new_file')
  nnoremap <silent><buffer> cd                  :call <SID>CD_AND_CLOSE()<cr>
  nnoremap <silent><buffer> ~                   :call <SID>CD_ROOT_AND_CLOSE()<CR>
  nnoremap <silent><buffer><expr> >             defx#do_action('resize', winwidth(0) + 6)
  nnoremap <silent><buffer><expr> <             defx#do_action('resize', winwidth(0) - 6)
  " nnoremap <silent><buffer><expr> l             defx#do_action('call', g:defx_config_sid . 'DEFX_SMART_L')
  nnoremap <silent><buffer><expr> x             defx#do_action('call', g:defx_config_sid . 'OPEN_AT_WSL_EXPLORER')
endfunction
]]
)

---------> autocmd
vim.cmd("autocmd FileType defx exec 'call ' . g:defx_config_sid . 'DEFX_MY_SETTINGS()' ")

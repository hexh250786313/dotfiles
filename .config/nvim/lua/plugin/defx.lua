vim.g.defx_icons_column_length = 2

vim.cmd(
  [[
call defx#custom#column('git', 'column_length', 1)

call defx#custom#column('filename', {
      \ 'min_width': 200,
      \ 'max_width': 1000,
      \ })
call defx#custom#column('indent', {
      \ 'indent': '  ',
      \ })
call defx#custom#column('icon', {
      \ 'directory_icon': '  ',
      \ 'opened_icon': '  ',
      \ 'file_icon': '   ',
      \ 'root_icon': '',
      \ })

function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'),
        \ '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

let g:defx_config_sid = s:SID_PREFIX()

autocmd FileType defx call s:defx_my_settings()

function! s:AutoSelect()
  let current_file_path = expand('%:p')
  if filereadable(current_file_path) == 0
    return
  endif
  let current_page_buffers_list = tabpagebuflist(tabpagenr())
  for i in current_page_buffers_list
    let buftype = getbufvar(i, '&filetype')
    if buftype == 'defx'
      :Defx `getcwd()` -no-focus -search-recursive=`expand('%:p')` -wincol=`&columns/9` -winwidth=`40` -preview-width=`&columns/2` -winrow=`&lines/9` -winheight=`&lines/2` -preview_height=`&lines/1`
      return
    endif
  endfor
endfunction

function! s:SetScrolloff()
  let current_file_type = &filetype
  if current_file_type == 'defx'
    setlocal scrolloff=99
    return
  endif
  " call CocPrint("no defx")
endfunction

augroup set_auto_select
  autocmd!
  autocmd BufEnter,BufRead * :call <SID>AutoSelect()
augroup END

augroup set_scroll_off
  autocmd!
  autocmd BufEnter * :call <SID>SetScrolloff()
augroup END

function! s:defx_my_settings() abort
  setlocal winhighlight=Normal:NormalStrongFont " 非活动时不变回 Normal
  setlocal winhighlight=CursorLine:DefxCursorLine
  " setlocal winhighlight=Normal:NormalStrongFont,NormalNC:Normal " 非活动时会变回 Normal

  setlocal cursorline
  setlocal nornu
  setlocal nonu
  setlocal shiftwidth=2
  setlocal scrolloff=99
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  " nnoremap <silent><buffer><expr> N
        " \ defx#do_action('new_file')
  " nnoremap <silent><buffer><expr> M
        " \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
        \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <tab>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
        \ defx#do_action('change_vim_cwd')

  " Custom mappings
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('call', g:defx_config_sid . 'DefxSmartL')
  nnoremap <silent><buffer><expr> <2-LeftMouse>
        \ <SID>defx_toggle_tree_right()
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('call', g:defx_config_sid . 'DefxSmartL')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('call', g:defx_config_sid . 'DefxSmartL')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('call', g:defx_config_sid . 'defx_toggle_tree_left')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \ 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> <C-n>
        \ defx#do_action('new_file')
  nnoremap <silent><buffer> cd :call LcdAndClose()<CR>
  nnoremap <silent><buffer> ~ :call CdRootAndClose()<CR>
  nnoremap <silent><buffer><expr> >
        \ defx#do_action('resize',
        \ winwidth(0) + 2)
  nnoremap <silent><buffer><expr> <
        \ defx#do_action('resize',
        \ winwidth(0) - 2)

endfunction

function! s:defx_toggle_tree_right() abort
  " Open current file, or toggle directory expand/collapse
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  if defx#is_binary()
    return defx#do_action('execute_system')
  endif
  " return defx#do_action('open')
  return defx#do_action('drop')
  " return defx#do_action('multi', ['quit', 'drop'])
endfunction

function! s:DefxSmartL(_)
  augroup set_auto_select
    autocmd!
  augroup END
  if defx#is_directory()
    call defx#call_action('open_or_close_tree')
  elseif defx#is_binary()
    call defx#call_action('execute_system')
  else
    let filepath = defx#get_candidate()['action__path']
    " ========== 以下操作是用来过滤掉非正常窗口
    " 当前页面的所有窗口的 buffer 列表, 会有重复, 例如 [4, 1, 3, 3, 3] 代表 5 个窗口, 其中三个窗口是同一个 buffer
    let current_page_buffers_list = tabpagebuflist(tabpagenr())
    " 用来存放正常窗口的 buffer 列表, 正常窗口指的是非 popup/autocmd/loclist/preview/quickfix/unknown 等的窗口
    let normal_wins_list = []
    let list = []
    for i in current_page_buffers_list
      let buflist = win_findbuf(i)
      for j in buflist
        let bufkind = win_gettype(j)
        if bufkind == '' " 空字符串代表正常的窗口
					call add(list, i) " 将正常的窗口加入列表
        endif
      endfor
    endfor
    let unduplist=filter(copy(list), 'index(list, v:val, v:key+1)==-1') " 去重
    call extend(normal_wins_list, unduplist)
    " ==========
    " 带上 '$' 参数会加上滚动条的 session
    " if tabpagewinnr(tabpagenr(), '$') >= 3    " if there are more than 2 normal windows
    if len(normal_wins_list) >= 3    " if there are more than 2 normal windows
      lua require('nvim-window').pick()
      let current_file = &filetype
      if current_file ==# 'defx'
        " echo 'cancel'
        exec 'wincmd p'
        let current_file_path = expand('%:p')
        if current_file_path != filepath
          exec 'e' filepath
        endif
      else
        let current_file_path = expand('%:p')
        if current_file_path != filepath
          exec 'e' filepath
        endif
      endif
    else
      exec 'wincmd w'
      let current_file_path = expand('%:p')
      if current_file_path != filepath
        exec 'e' filepath
      endif
    endif
  endif
  augroup set_auto_select
    autocmd!
    autocmd BufEnter,BufRead * :call <SID>AutoSelect()
  augroup END
endfunction

function! s:defx_toggle_tree_right_preview() abort
  " Open current file, or toggle directory expand/collapse
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  if defx#is_binary()
    return defx#do_action('execute_system')
  endif
  " return defx#do_action('open')
  " return defx#do_action('drop')
  return defx#do_action('preview')
endfunction

function! s:defx_toggle_tree_left(_)
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
  if s:trim_right(s:parent, '/') == s:trim_right(b:defx.paths[0], '/')
    return defx#call_action('cd', ['..'])
  endif

  " move to parent.
  call defx#call_action('search', s:parent)

  " if you want close_tree immediately, enable below line.
  call defx#call_action('close_tree')
endfunction

function! s:lcd()
  let s:candidate = defx#get_candidate()
  let s:current = fnamemodify(s:candidate['action__path'], ':p:h')
  let previous_win_id = win_getid(winnr('#'))
  call win_gotoid(previous_win_id)
  execute 'lcd '.s:current
endfunction

function s:findRoot()
  " 获取 git 仓库根目录
  let result = system('git rev-parse --show-toplevel')
  if v:shell_error == 0
    return substitute(result, '\n*$', '', 'g')
  endif

  return "."
endfunction

function! s:cdRoot()
  " keepalt below 9 new
  let root = s:findRoot()
  if root != '.'
    " 执行 lcd 只改变当前 buffer 的工作目录
    let previous_win_id = win_getid(winnr('#'))
    call win_gotoid(previous_win_id)
    execute 'lcd '.root
  endif
endfunction

fu! StartsWith(longer, shorter) abort
  return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction

fu! FileIsInDirectory(directory) abort
  let l:fname = expand('%:p')
  return StartsWith(l:fname, a:directory)
endfunction

function LcdAndClose ()
  :call <SID>lcd()
  let directory = getcwd()
  if FileIsInDirectory(directory)
    :Defx `getcwd()` -search-recursive=`expand('%:p')` -wincol=`&columns/9` -winwidth=`40` -preview-width=`&columns/2` -winrow=`&lines/9` -winheight=`&lines/2` -preview_height=`&lines/1`
  else
    :Defx `getcwd()` -wincol=`&columns/9` -winwidth=`40` -preview-width=`&columns/2` -winrow=`&lines/9` -winheight=`&lines/2` -preview_height=`&lines/1`
  end
endfunction

function CdRootAndClose ()
  :call <SID>cdRoot()
  let directory = getcwd()
  if FileIsInDirectory(directory)
    :Defx `getcwd()` -search-recursive=`expand('%:p')` -wincol=`&columns/9` -winwidth=`40` -preview-width=`&columns/2` -winrow=`&lines/9` -winheight=`&lines/2` -preview_height=`&lines/1`
  else
    :Defx `getcwd()` -wincol=`&columns/9` -winwidth=`40` -preview-width=`&columns/2` -winrow=`&lines/9` -winheight=`&lines/2` -preview_height=`&lines/1`
  end
endfunction


call defx#custom#option('_', {
      \ 'show_ignored_files': 1,
      \ 'listed': 1,
      \ 'columns': 'mark:git:indent:icon:icons:filename',
      \ 'split': 'vertical',
      \ 'winborder': ['╭', '─', '╮', '│', '╯', '─', '╰', '│'],
      \ 'vertical_preview': 1,
      \ 'resume': 1,
      \ 'direction': 'topleft',
      \ })

call defx#custom#column('git', 'indicators', {
      \ 'Modified'  : '',
      \ 'Staged'    : '✚',
      \ 'Untracked' : '✭',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Ignored'   : '☒',
      \ 'Deleted'   : '✖',
      \ 'Unknown'   : '?'
      \ })

function! s:trim_right(str, trim)
  return substitute(a:str, printf('%s$', a:trim), '', 'g')
endfunction

nmap <silent> <Space>fo :Defx `getcwd()` -search-recursive=`expand('%:p')` -wincol=`&columns/9` -winwidth=`40` -preview-width=`&columns/2` -winrow=`&lines/9` -winheight=`&lines/2` -preview_height=`&lines/1`<CR>
nmap <silent> <Space>fr :Defx -no-resume `getcwd()` -search-recursive=`expand('%:p')` -wincol=`&columns/9` -winwidth=`40` -preview-width=`&columns/2` -winrow=`&lines/9` -winheight=`&lines/2` -preview_height=`&lines/1`<CR>
nmap <silent> <Space>fc :Defx -close<CR>

]]
)

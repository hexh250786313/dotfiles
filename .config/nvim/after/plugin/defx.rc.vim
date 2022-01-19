if !exists('g:loaded_defx') | finish | endif

" autocmd FileType defx call s:defx_my_settings()

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  setlocal cursorline
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
  nnoremap <silent><buffer><expr> M
        \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
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
  nnoremap <silent><buffer><expr> <Space>
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
  nnoremap <silent><buffer><expr> <CR>
        \ <SID>defx_toggle_tree_right()
  nnoremap <silent><buffer><expr> <2-LeftMouse>
        \ <SID>defx_toggle_tree_right()
  nnoremap <silent><buffer><expr> l
        \ <SID>defx_toggle_tree_right_preview()
  nnoremap <silent><buffer><expr> o
        \ <SID>defx_toggle_tree_right()
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('call', g:defx_config_sid . 'defx_toggle_tree_left')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \ 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> <C-n>
        \ defx#do_action('new_file')

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
  " return defx#do_action('drop')
  return defx#do_action('multi', ['quit', 'drop'])
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

call defx#custom#option('_', {
      \ 'show_ignored_files': 1,
      \ 'listed': 1,
      \ 'columns': 'mark:git:indent:icons:filename:type',
      \ 'split': 'floating',
      \ 'winborder': ['╭', '─', '╮', '│', '╯', '─', '╰', '│'],
      \ 'floating_preview': 1,
      \ 'vertical_preview': 1,
      \ })

      " \ 'resume': 1,
      " \ 'wincol': &columns / 9,
      " \ 'winwidth': &columns / 3,
      " \ 'preview_width': &columns / 2,
      " \ 'winrow': &lines / 9,
      " \ 'winheight': &lines / 1.5,
      " \ 'preview_height': &lines / 1.3,

call defx#custom#column('git', 'indicators', {
      \ 'Modified'  : 'M',
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

function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'),
        \ '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

let g:defx_config_sid = s:SID_PREFIX()


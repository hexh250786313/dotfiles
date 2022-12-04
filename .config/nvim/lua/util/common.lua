vim.cmd([[
function! IgnoreFile(...)
  let l:args = a:000
  if len(l:args) == 1
    let l:patterns = args[0]

    let l:fd = 'fd --type f --hidden'
    for i in split(l:patterns, ",")
        let l:fd .= ' --exclude ' . '"' . i . '"'
    endfor
    let g:fzf_source = l:fd

    if match(&runtimepath, 'Defx') != -1
        call defx#custom#option('_', {
          \     'show_ignored_files': 0,
          \     'ignored_files': l:patterns,
          \ })
    endif
  endif
endfunction

function! DefxIgnoreFile(...)
    let l:args = a:000
    if len(l:args) == 1
        let l:patterns = args[0]
        if match(&runtimepath, 'Defx') != -1
            call defx#custom#option('_', {
              \     'show_ignored_files': 0,
              \     'ignored_files': l:patterns,
              \ })
        endif
    endif
endfunction

function! DefxWinWidth(...)
    let l:args = a:000
    if len(l:args) == 1
        let l:width = args[0]
        if match(&runtimepath, 'Defx') != -1
            call defx#custom#column('filename', {
              \     'min_width': l:width - 2,
              \ })
            call defx#custom#option('_', {
              \     'winwidth': l:width,
              \ })
        endif
    endif
endfunction

]])

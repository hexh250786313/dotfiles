vim.cmd(
  [[
" xsel -i -b 可以跨 vmware, 原理不明, nvim 自己的复制用的是 xclip, 无法跨 vmware
function! ClipboardYank(type)
  let saved_unnamed_register = @@
  " echo "--" . a:type . "\n"
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'V'
    normal! `<V`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  " echo @@
  " let word0 = substitute(@@, '\n$', '', 'g')
  " let word0 = escape(word, '| ') " escape ' ' to '\ '
  let word1 = substitute(@@, '\\', '\\\\', 'g') " For shell xsel
  let word2 = substitute(word1, "\\'", "'\\\\''", 'g') " For shell "echo" command: ' to '\'' --- Example: [echo 'It's me'] should be [echo 'It'\''s me']
  let word = word2
  let @@ = saved_unnamed_register
  call system("echo -n '" . word . "' | xsel -i -b") " -n for not including newline, i.e. \n .
endfunction

function! CloseSQAndSG()
  :lua require('spectre').close()
  :ccl
endfunction

function! DeleteAllBuffers() abort
  if confirm('Kill all other buffers?', "&Yes\n&No\n&Cancel") == 1
    let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val)')
    for i in blisted
      if i != bufnr('%')
        try 
          exe 'bw ' . i
        catch
        endtry
      endif
    endfor
  endif
endfunction

function! CocPrint(str)
  let lines = split(a:str, '\n')
  call coc#notify#create(lines, {
    \ 'borderhighlight': 'CocInfoSign',
    \ 'timeout': 30000,
    \ 'kind': 'warning',
    \ })
endfunction
]]
)

vim.cmd(
  [[
function CloseDefx ()
  :Defx -close
endfunction

function OpenQF ()
  :wincmd H
  :vertical resize 40
  :set winfixwidth
  :set winfixheight
  " :call timer_start(0, { -> CloseDefx()}) " this one works
  " :call CloseDefx()                     " this one throws error
  :lua require('spectre').close()
endfunction

function OpenSpectrePanel ()
  :vertical resize 80
  :set winfixwidth
  :set winfixheight
  " :call CloseDefx()
endfunction

" 约 50K
autocmd BufEnter * if line2byte('$') + len(getline('$')) > 51200 | syntax clear | setlocal nowrap | endif

function Test1 ()
  let l:hsl = Darken('#fabd2f')
 :call CocPrint(l:hsl)
endfunction

function CopyToXsel ()
  let content = @@
  let word1 = substitute(content, '\\', '\\\\', 'g')
  let word2 = substitute(word1, "\\'", "'\\\\''", 'g')
  let word = word2
  call system("echo -n '" . word . "' | xsel -i -b")
endfunction

function PasteFromXsel ()
  let @@ = getreg('+')
endfunction

function! SetFocusYank ()
  call UnsetFocusYank()
  augroup set_focus_yank
    autocmd!
    autocmd FocusLost * call CopyToXsel()
    autocmd FocusGained * call PasteFromXsel()
  augroup END
endfunction

function! UnsetFocusYank ()
  augroup set_focus_yank
    autocmd!
  augroup END
endfunction

call SetFocusYank()

function s:SystemClipboardForSpecBuffer()
  noremap y "+y
  noremap p "+p

  vnoremap x "+d
  nnoremap x v"+d
  vnoremap d "+d
  vnoremap s "+s

  nnoremap yy "+yy
  nnoremap dd "+dd
endfunction

autocmd FileType gitcommit call <SID>SystemClipboardForSpecBuffer()
]]
)

vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = "silent call OpenQF()"})
vim.api.nvim_create_autocmd({"FileType, BufEnter"}, {pattern = "markdown", command = "setlocal nowrap"})
vim.api.nvim_create_autocmd(
  {"FileType, BufferEnter"},
  {pattern = "spectre_panel", command = "silent call OpenSpectrePanel()"}
)
-- vim.api.nvim_create_autocmd({"BufferEnter"}, {pattern = "*", command = "call Test1()"})
-- vim.api.nvim_create_autocmd(
-- {"CursorHold"},
-- {pattern = "*", command = "call Test1()"}
-- )

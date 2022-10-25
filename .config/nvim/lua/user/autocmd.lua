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
  :call timer_start(0, { -> CloseDefx()}) " this one works
  " :call CloseDefx()                     " this one throws error
  :lua require('spectre').close()
endfunction

function OpenSpectrePanel ()
  :vertical resize 80
  :set winfixwidth
  :set winfixheight
  :call CloseDefx()
endfunction

" 约 50K
autocmd BufEnter * if line2byte('$') + len(getline('$')) > 51200 | syntax clear | endif

function Test1 ()
  let l:hsl = Darken('#fabd2f')
 :call CocPrint(l:hsl)
endfunction
]]
)

vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = "silent call OpenQF()"})
vim.api.nvim_create_autocmd(
  {"FileType, BufferEnter"},
  {pattern = "spectre_panel", command = "silent call OpenSpectrePanel()"}
)
-- vim.api.nvim_create_autocmd({"BufferEnter"}, {pattern = "*", command = "call Test1()"})
-- vim.api.nvim_create_autocmd(
-- {"CursorHold"},
-- {pattern = "*", command = "call Test1()"}
-- )

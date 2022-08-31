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
]]
)

vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = "silent call OpenQF()"})
vim.api.nvim_create_autocmd(
  {"FileType, BufferEnter"},
  {pattern = "spectre_panel", command = "silent call OpenSpectrePanel()"}
)

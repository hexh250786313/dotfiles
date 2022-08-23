vim.cmd(
  [[
function OpenQF ()
  :wincmd H
  :vertical resize 40
  :set winfixwidth
  :set winfixheight
  :lua require('spectre').close()
endfunction

function OpenSpectrePanel ()
  :vertical resize 90
  :set winfixwidth
  :set winfixheight
endfunction
]]
)

vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = "silent call OpenQF()"})
vim.api.nvim_create_autocmd(
  {"FileType, BufferEnter"},
  {pattern = "spectre_panel", command = "silent call OpenSpectrePanel()"}
)

vim.cmd([[
function OpenQF ()
  :wincmd H
  :vertical resize 40
  :set winfixwidth
  :set winfixheight
endfunction
]])

vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = "silent call OpenQF()"})


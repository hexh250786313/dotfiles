local api = vim.api

require("focus").setup({enable = true})
api.nvim_set_keymap("n", "<space>wf", ":FocusToggle<CR>", {silent = true})
api.nvim_create_autocmd({"VimEnter"}, {pattern = "*", command = "FocusDisable"})

vim.cmd([[
function DisabaleFocusAndOpenQF ()
  :FocusDisable
  :wincmd H
  :vertical resize 40
  :set winfixwidth
  :set winfixheight
endfunction
]])

vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = "silent call DisabaleFocusAndOpenQF()"})

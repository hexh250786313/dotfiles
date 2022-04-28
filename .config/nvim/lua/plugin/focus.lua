local api = vim.api

require("focus").setup({enable = true})
api.nvim_set_keymap("n", "<space>wf", ":FocusToggle<CR>", {silent = true})
api.nvim_create_autocmd({"VimEnter"}, {pattern = "*", command = "FocusDisable"})

vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = "wincmd H"})
vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = "vertical resize 40"})
vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = "set winfixwidth"})
vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = "set winfixheight"})

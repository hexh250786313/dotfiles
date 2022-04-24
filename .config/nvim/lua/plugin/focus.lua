local api = vim.api

require("focus").setup({enable = true})
api.nvim_set_keymap("n", "<space>wf", ":FocusToggle<CR>", {silent = true})
api.nvim_create_autocmd({"VimEnter"}, {pattern = "*", command = "FocusDisable"})

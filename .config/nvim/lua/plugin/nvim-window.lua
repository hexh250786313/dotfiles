require("nvim-window").setup({})

vim.api.nvim_set_keymap("n", "<space>ww", ":lua require('nvim-window').pick()<cr>", {silent = true})

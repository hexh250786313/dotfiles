require("git-conflict").setup({})

vim.keymap.set("n", "<space>sc", ":GitConflictListQf<cr>", {silent = true})

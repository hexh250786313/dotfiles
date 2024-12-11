local wk = require("which-key")
wk.register({ mode = { "n", "x" }, ["<leader>c"] = { name = "Code" } })

vim.keymap.set('n', 'J', 'gJ', { noremap = true }) -- shift+j 不插入空格

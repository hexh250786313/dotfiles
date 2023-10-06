vim.g.fugitive_pty = 0

---- 快捷键
local wk = require("which-key")
wk.register({ mode = { "n" }, ["<leader>gg"] = { "<cmd>Git<cr>", "Git status" } })

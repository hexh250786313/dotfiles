require("multiple-cursors").setup {}
local wk = require("which-key")
wk.register({ mode = { "n", "i" }, ["<C-Down>"] = { "<cmd>MultipleCursorsAddDown<cr>", "" } })
wk.register({ mode = { "n", "i" }, ["<C-Up>"] = { "<cmd>MultipleCursorsAddUp<cr>", "" } })
wk.register({ mode = { "n", "i" }, ["<C-LeftMouse>"] = { "<cmd>MultipleCursorsMouseAddDelete<cr>", "" } })

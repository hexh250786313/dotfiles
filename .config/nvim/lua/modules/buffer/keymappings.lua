local wk = require("which-key")

wk.register({["<leader>b"] = {name = "Buffer"}, ["g"] = {["<tab>"] = {"<c-^>", "Back to previous buffer"}}})

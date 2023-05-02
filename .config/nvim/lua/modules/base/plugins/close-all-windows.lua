---------> 快捷键
local wk = require("which-key")
wk.register({["<leader>qW"] = {"<cmd>call _self#window#close_all_windows()<cr>", "Close all windows except this"}})

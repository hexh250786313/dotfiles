---------> 快捷键
local wk = require("which-key")
wk.register({
  ["<leader>qB"] = { "<cmd>call _self#buffer#delete_all_buffers()<cr>i<esc>", "Delete all buffers except current one" },
})

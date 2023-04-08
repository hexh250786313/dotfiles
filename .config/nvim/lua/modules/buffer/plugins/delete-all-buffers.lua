---------> 快捷键
local wk = require("which-key")
wk.register({
  ["<leader>qB"] = {
    "<cmd>call _self#buffer#delete_all_buffers()<cr>",
    "Delete all buffers except current one"
  }
})

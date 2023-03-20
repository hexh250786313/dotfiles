---------> 快捷键
local wk = require("which-key")
wk.register(
  {
    ["<leader>bD"] = {"<cmd>call _self#buffer#delete_all_buffers()<cr>", "Open file explorer"}
  }
)

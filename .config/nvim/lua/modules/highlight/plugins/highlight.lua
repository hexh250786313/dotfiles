---- 快捷键
local wk = require("which-key")
wk.register({
  mode = {"n"},
  ["<leader>hb"] = {"<cmd>call _self#highlight#toggle_normal_background()<cr>", "Toggle transparent background"},
  ["<leader>hc"] = {"<cmd>call _self#highlight#toggle_cursorline()<cr>", "Toggle cursorline"}
})

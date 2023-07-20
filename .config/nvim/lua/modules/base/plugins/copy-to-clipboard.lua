---------> 快捷键
local wk = require("which-key")
wk.register({
  mode = {"x"},
  ["<leader>y"] = {":<c-u>call _self#yank#copy_to_clipboard(visualmode())<cr>", "Copy to clipboard"}
})
wk.register({mode = {"n", "x"}, ["<leader>p"] = {'"+p', "Paste from clipboard"}})

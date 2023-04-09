local wk = require("which-key")
wk.register({
  mode = {"n"},
  ["<leader>wj"] = {"<c-w>j", "Jump to the below window"},
  ["<leader>wh"] = {"<c-w>h", "Jump to the left window"},
  ["<leader>wk"] = {"<c-w>k", "Jump to the above window"},
  ["<leader>wl"] = {"<c-w>l", "Jump to the right window"}
})

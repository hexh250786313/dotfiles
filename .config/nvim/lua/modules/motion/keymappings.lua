local wk = require("which-key")
wk.register({
  mode = { "n" },
  ["<leader>wj"] = { "<c-w>j", "Jump to the below window" },
  ["<leader>wh"] = { "<c-w>h", "Jump to the left window" },
  ["<leader>wk"] = { "<c-w>k", "Jump to the above window" },
  ["<leader>wl"] = { "<c-w>l", "Jump to the right window" },
  ["<S-Up>"] = { "<c-u>", "Scroll up half a page" },
  ["<S-Down>"] = { "<c-d>", "Scroll down half a page" },
})

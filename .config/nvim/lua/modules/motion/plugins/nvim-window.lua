---- 快捷键
local wk = require("which-key")
wk.register({
  mode = { "n" },
  ["<leader>ww"] = { "<cmd>lua require('nvim-window').pick()<cr>", "Jump to selected window" },
})

---- 配置
require("nvim-window").setup({ normal_hl = "Visual", hint_hl = "Bold", border = "none" })

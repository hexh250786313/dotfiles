---- 快捷键
local wk = require("which-key")
wk.register(
  {
    mode = {"n", "x"},
    ["f"] = {"<cmd>:HopChar1<cr>", "Jump to char"}
  }
)

---- 配置
require("hop").setup({create_hl_autocmd = true})

local wk = require("which-key")
wk.register({ mode = { "n" }, ["<leader>mm"] = { ":lua MiniMap.toggle()<cr>", "Toggle MiniMap" } })

require("mini.map").setup({
  symbols = {
    encode = require("mini.map").gen_encode_symbols.block("3x2"),
    -- scroll_line = "▶ ",
    scroll_line = "┃ ",
    scroll_view = "┃ ",
  },
  -- window = { show_integration_count = true, width = 10 },
  window = { show_integration_count = true, width = 1 },
})

-- 进入 vim 后启动 MiniMap
vim.cmd("autocmd VimEnter * lua MiniMap.open()")

-- vim.notify = require("notify")

require("notify").setup({
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { zindex = 999 })
  end,
})

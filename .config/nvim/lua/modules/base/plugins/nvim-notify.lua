-- vim.notify = require("notify")

require("notify").setup({
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { zindex = 999 })
  end,
  max_width = 100,  -- 设置最大宽度为100字符
})

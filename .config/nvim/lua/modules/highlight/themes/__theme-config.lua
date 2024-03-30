-- theme-config.lua
local M = {}

local theme = require('modules/highlight/themes/rose-pine-neovim')

function M.get_current_theme()
  vim.cmd([[ set background=dark ]]) -- 背景 "light" | "dark"

  -- 返回不同的主题配置对象
  return theme
end

return M

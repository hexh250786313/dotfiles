local M = {}

M.name = "rose-pine/neovim"

function M.setup()
  vim.cmd([[
  colorscheme rose-pine
  ]])
end

return M

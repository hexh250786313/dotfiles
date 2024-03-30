local M = {}

M.name = "catppuccin/nvim"

function M.setup()
  vim.cmd([[ colorscheme catppuccin ]])
end

return M

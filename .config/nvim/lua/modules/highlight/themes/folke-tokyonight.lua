local M = {}

M.name = "folke/tokyonight.nvim"

function M.setup()
  vim.cmd([[ colorscheme tokyonight-night ]])
end

return M

local M = {}

M.name = "pbrisbin/vim-colors-off"

function M.setup()
  vim.cmd([[ colorscheme off ]])
end

return M

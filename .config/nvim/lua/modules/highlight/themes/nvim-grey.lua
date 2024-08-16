local M = {}

M.name = "yorickpeterse/nvim-grey"

function M.setup()
  vim.cmd([[
  colorscheme grey
  ]])
end

return M

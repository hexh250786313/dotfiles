local M = {}

M.name = "catppuccin/nvim"

function M.setup()
  require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
  })
  vim.cmd([[
  colorscheme catppuccin
  ]])
end

return M

local M = {}

M.name = "rose-pine/neovim"

function M.setup()
  vim.cmd([[
  colorscheme rose-pine
  hi! link CocMarkdownCode Comment
  ]])
end

return M

local M = {}

M.name = "pbrisbin/vim-colors-off"

function M.setup()
  vim.cmd([[
  colorscheme off
  hi! link CocMarkdownCode Comment
  ]])
end

return M

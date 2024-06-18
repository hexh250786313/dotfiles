local M = {}

M.name = "sainnhe/everforest"

function M.setup()
  vim.cmd([[
  colorscheme everforest
  autocmd VimEnter * exec 'hi! link CocMenuSel PmenuSel'
  ]])
end

return M

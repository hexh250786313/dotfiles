local M = {}

M.name = "https://github.com/ofirgall/ofirkai.nvim"

function M.setup()
  local scheme = require('ofirkai.design').scheme
  vim.cmd("autocmd VimEnter * exec 'hi! FoldColumn guibg=" .. scheme.background .. " guifg=" .. scheme.white .. "'")
  vim.cmd("colorscheme ofirkai")
end

return M

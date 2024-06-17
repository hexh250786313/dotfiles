local M = {}

M.name = "https://github.com/ofirgall/ofirkai.nvim"

function M.setup()
  vim.cmd("colorscheme ofirkai")
  vim.cmd([[
  autocmd VimEnter * exec 'hi! FoldColumn gui=none guifg=' . luaeval("require('ofirkai.design').scheme.white") . ' guibg=' . _self#highlight#pick('Normal', 'bg')
  ]])
end

return M

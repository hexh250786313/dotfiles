local M = {}

M.name = "polirritmico/monokai-nightasty.nvim"

function M.setup()
  vim.cmd([[
  colorscheme monokai-nightasty
  autocmd VimEnter * exec 'hi! FoldColumn gui=none guifg=' . luaeval("require('monokai-nightasty.colors').default.orange") . ' guibg=' . _self#highlight#pick('Normal', 'bg')
  ]])
  -- print(vim.inspect(require("monokai-nightasty.colors").default))
end

return M

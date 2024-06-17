local M = {}

M.name = "folke/tokyonight.nvim"

function M.setup()
  vim.cmd([[ colorscheme tokyonight-night ]])
  vim.cmd([[
  autocmd VimEnter * exec 'hi! FoldColumn gui=none guifg=' . luaeval("require('tokyonight.colors').default.comment") . ' guibg=' . _self#highlight#pick('Normal', 'bg')
  ]])
end

return M

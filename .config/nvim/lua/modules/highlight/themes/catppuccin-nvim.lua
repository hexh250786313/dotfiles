local M = {}

M.name = "catppuccin/nvim"

function M.setup()
  require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
  })
  vim.cmd([[
  colorscheme catppuccin
  autocmd VimEnter * exec 'hi! @punctuation.bracket' .
    \' guibg=' . _self#highlight#pick('@punctuation', 'bg') .
    \' guifg=' . _self#highlight#pick('@punctuation', 'fg')
  ]])
end

return M

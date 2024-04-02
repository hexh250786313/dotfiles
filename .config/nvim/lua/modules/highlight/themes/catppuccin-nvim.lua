local M = {}

M.name = "catppuccin/nvim"

function M.setup()
  vim.cmd([[
  colorscheme catppuccin
  autocmd VimEnter * exec 'hi! @punctuation.bracket' .
    \' guibg=' . _self#highlight#pick('@punctuation', 'bg') .
    \' guifg=' . _self#highlight#pick('@punctuation', 'fg')
  ]])
end

return M

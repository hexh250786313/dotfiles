local M = {}

M.name = "rose-pine/neovim"

function M.setup()
  vim.cmd([[
  colorscheme rose-pine
  autocmd VimEnter * exec 'hi! @punctuation.bracket' .
    \' guibg=' . _self#highlight#pick('@punctuation', 'bg') .
    \' guifg=' . _self#highlight#pick('@punctuation', 'fg')
  ]])
end

return M

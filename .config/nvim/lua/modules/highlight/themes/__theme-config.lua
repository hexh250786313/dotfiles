-- theme-config.lua
local M = {}

-- local theme = require('modules/highlight/themes/catppuccin-nvim')
-- local theme = require('modules/highlight/themes/rockyzhang24-arctic')
-- local theme = require('modules/highlight/themes/rose-pine-neovim')
-- local theme = require('modules/highlight/themes/folke-tokyonight')
-- local theme = require('modules/highlight/themes/pbrisbin-vim-colors-off')
-- local theme = require('modules/highlight/themes/sainnhe-everforest')
local theme = require('modules/highlight/themes/polirritmico-monokai-nightasty')

function M.get_current_theme()
  theme.commonSetup = function()
    vim.cmd([[
    set background=dark " 背景 "light" | "dark"
    " set background=light " 背景 "light" | "dark"
    autocmd VimEnter * exec 'hi! @punctuation.bracket' .
      \' guibg=' . _self#highlight#pick('@punctuation', 'bg') .
      \' guifg=' . _self#highlight#pick('@punctuation', 'fg')
    ]])
  end

  -- 返回不同的主题配置对象
  return theme
end

return M

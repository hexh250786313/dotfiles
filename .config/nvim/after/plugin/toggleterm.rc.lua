require("toggleterm").setup {
  -- open_mapping = [[<c-\>]],
  -- direction = 'float',
  float_opts = {
    border = "curved"
  }
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit =
  Terminal:new(
  {
    cmd = "lazygit",
    direction = "float"
  }
)

function _lazygit_toggle()
  lazygit:toggle()
end

-- vim.api.nvim_set_keymap("n", "<space>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

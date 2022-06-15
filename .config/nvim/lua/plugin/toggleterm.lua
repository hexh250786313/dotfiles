require("toggleterm").setup {
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
local gitwebui =
  Terminal:new(
  {
    cmd = "git webui --port=9989",
    direction = "float"
  }
)

function _lazygit_toggle()
  lazygit:toggle()
end

function _gitwebui_toggle()
  gitwebui:toggle()
end

vim.api.nvim_set_keymap("n", "<space>gl", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>gw", "<cmd>lua _gitwebui_toggle()<CR>", {noremap = true, silent = true})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, "t", "<c-t>", [[<C-\><C-n>:q<cr>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, "t", "<esc><esc>", [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd(
  [[
autocmd! TermOpen term://* lua set_terminal_keymaps()

nnoremap <c-t> <cmd>ToggleTerm direction=float<cr>
]]
)

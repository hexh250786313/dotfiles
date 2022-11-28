local fn = vim.fn

local function get_color(group, attr)
  return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end

require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 9
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  float_opts = {
    border = {"▃", "▃", "▃", "█", "▀", "▀", "▀", "█"}
    -- border = {"", "", "", "█", "", "", "", "█"}
    -- border = {"", "", "", "", "", "", "", ""}
  },
  highlights = {
    NormalFloat = {
      link = "StatusLine"
    },
    FloatBorder = {
      guifg = get_color("StatusLine", "bg")
      -- guibg = get_color("", "fg"),
    }
  }
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit =
  Terminal:new(
  {
    cmd = "lazygit -ucf ~/workspace/dotfiles/.config/lazygit/config.yml",
    direction = "float",
    count = 7
  }
)
local gitwebui =
  Terminal:new(
  {
    cmd = "git webui --port=9989",
    direction = "float",
    count = 6
  }
)

function _lazygit_toggle()
  vim.cmd("let g:floating_termnr = " .. 7)
  lazygit:toggle()
end

function _gitwebui_toggle()
  vim.cmd("let g:floating_termnr = " .. 6)
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

let g:floating_termnr = 1

function! s:ToggleTerm()
  " exe v:count1 . "ToggleTerm direction=float"
  exe g:floating_termnr . "ToggleTerm direction=float"
endfunction

" nnoremap <c-t> <cmd>ToggleTerm direction=float<cr>
" nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>
nnoremap <silent><c-t> :call <SID>ToggleTerm()<CR>
]]
)

local M = {}

function M.watch_term(opts)
  local termnr = 9
  local close = false
  if opts.option then
    local opt = vim.json.decode(opts.option)
    local next_termnr = opt.termnr
    local next_close = opt.close
    if next_termnr then
      termnr = next_termnr
    end
    if next_close then
      close = next_close
    end
  end
  vim.cmd("let g:floating_termnr = " .. termnr)

  local _watch_term =
    Terminal:new(
    {
      cmd = opts.cmd,
      dir = opts.cwd,
      direction = "float",
      count = termnr,
      close_on_exit = close
    }
  )
  _watch_term:toggle(opts)
end

vim.cmd([[

" autocmd TermEnter,TermOpen term://*toggleterm#* call CopyToXsel() | call UnsetFocusYank()
" autocmd TermLeave,TermClose term://*toggleterm#* call SetFocusYank() | call PasteFromXsel()
]])

return M

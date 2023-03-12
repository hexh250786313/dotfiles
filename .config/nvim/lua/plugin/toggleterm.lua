local fn = vim.fn

local function get_color(group, attr)
  return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end

require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 19
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  start_in_insert = true,
  -- persist_mode = true,
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
  },
  auto_scroll = true
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit =
  Terminal:new(
  {
    cmd = "lazygit -ucf ~/workspace/hexh/dotfiles/.config/lazygit/config.yml",
    direction = "float",
    count = 7,
    on_open = function(term)
      vim.cmd("startinsert!")
      -- vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd("startinsert!")
    end,
    auto_scroll = false
  }
)
local gitwebui =
  Terminal:new(
  {
    cmd = "git webui --port=9989",
    direction = "horizontal",
    count = 6,
    auto_scroll = false
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
  vim.api.nvim_buf_set_keymap(0, "t", "<c-r>", [[<C-\><C-n>]], opts)

  vim.api.nvim_buf_set_keymap(0, "t", "<F1>", [[<C-\><C-n>:<C-U>CustomToggleTerm(1)<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<F2>", [[<C-\><C-n>:<C-U>CustomToggleTerm(2)<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<F3>", [[<C-\><C-n>:<C-U>CustomToggleTerm(3)<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<F4>", [[<C-\><C-n>:<C-U>CustomToggleTerm(4)<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<F5>", [[<C-\><C-n>:<C-U>CustomToggleTerm(5)<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<F6>", [[<C-\><C-n>:<C-U>CustomToggleTerm(6)<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<F7>", [[<C-\><C-n>:<C-U>CustomToggleTerm(7)<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<F8>", [[<C-\><C-n>:<C-U>CustomToggleTerm(8)<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<F9>", [[<C-\><C-n>:ToggleTermToggleAll<CR>]], opts)

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

function! s:ToggleTerm(count)
  if a:count != 0
    let g:floating_termnr = a:count
  endif
  " exe g:floating_termnr . "ToggleTerm direction=float"
  exe g:floating_termnr . "ToggleTerm"
endfunction

" nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>
command! -nargs=1 CustomToggleTerm call <SID>ToggleTerm(<args>)
nnoremap <silent><c-t> :<C-U>CustomToggleTerm(v:count)<CR>

map <F1> :<C-U>CustomToggleTerm(1)<CR>
map <F2> :<C-U>CustomToggleTerm(2)<CR>
map <F3> :<C-U>CustomToggleTerm(3)<CR>
map <F4> :<C-U>CustomToggleTerm(4)<CR>
map <F5> :<C-U>CustomToggleTerm(5)<CR>
map <F6> :<C-U>CustomToggleTerm(6)<CR>
map <F7> :<C-U>CustomToggleTerm(7)<CR>
map <F8> :<C-U>CustomToggleTerm(8)<CR>
map <F9> :ToggleTermToggleAll<CR>
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
      direction = "horizontal",
      count = termnr,
      close_on_exit = close,
      auto_scroll = true
    }
  )
  _watch_term:toggle(opt)
end

vim.cmd(
  [[
function! s:ResetFloatingTermnr()
    let l:win_name = expand('%:p')
    let l:num = l:win_name =~ '\d\+$' ? matchstr(l:win_name, '\d\+$') : 1
    let g:floating_termnr = l:num
endfunction

autocmd TermEnter,TermOpen term://*toggleterm#* call <SID>ResetFloatingTermnr()
autocmd TermLeave,TermClose term://*toggleterm#* call <SID>ResetFloatingTermnr()
autocmd BufEnter term://*toggleterm#* call <SID>ResetFloatingTermnr()
autocmd BufLeave term://*toggleterm#* call <SID>ResetFloatingTermnr()
]]
)

return M

vim.cmd([[
language en_US.UTF-8
]])

local optionList = {
  mouse = "a",
  -- nocompatible = 1,
  number = true,
  -- title = true,
  -- autoindent = true,
  -- nobackup = 1,
  -- nowritebackup = true,
  hlsearch = true,
  -- showcmd = true,
  -- cmdheight=1,
  -- laststatus=2,
  scrolloff = 9,
  -- expandtab = true,
  relativenumber = true,
  -- shell="zsh",
  -- backupskip="/tmp/*,/private/tmp/*",
  updatetime = 300,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  termguicolors = true,
  background = "dark",
  ignorecase = true,
  smartcase = true,
  foldlevel = 99,
  wrap = false

  -- wrap = false,
  -- number = true,
  -- hidden = true,
  -- cursorline = true,
  -- termguicolors = true,
  -- swapfile = false,
  -- autoread = true,
  -- background = "light",
  -- synmaxcol = 300,
  -- colorcolumn = { 80, 120 },
  -- signcolumn = "number",
  -- list = true,
  -- completeopt = "menuone,noselect",
  -- pumheight = 15,
  -- foldmethod = "indent",
  -- foldlevelstart = 10,

  -- -- time
  -- updatetime = 300,
  -- timeoutlen = 400,
  -- jumpoptions = "stack",

  -- -- match
  -- showmatch = true,
  -- matchtime = 1,

  -- -- undo
  -- undofile = true,
  -- undodir = vim.fn.stdpath("config") .. "/.undo",

  -- -- scrolloff
  -- scrolloff = 3,
  -- sidescrolloff = 3,

  -- -- search
  -- hlsearch = true,
  -- ignorecase = true,
  -- smartcase = true,

  -- -- tab
  -- tabstop = 4,
  -- shiftwidth = 4,
  -- softtabstop = 4,
  -- expandtab = true,
  -- shiftround = true,
  -- smartindent = true,

  -- -- split
  -- splitright = true,
  -- splitbelow = true,
}

-- vim.opt.shortmess:append({ c = true })

for k, v in pairs(optionList) do
  vim.opt[k] = v
end

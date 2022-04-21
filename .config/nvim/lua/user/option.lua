vim.cmd([[
language en_US.UTF-8
]])

local optionList = {
  mouse = "a",
  number = true,
  title = true,
  hlsearch = true,
  scrolloff = 9,
  relativenumber = true,
  updatetime = 300,
  cursorline = true,
  termguicolors = true,
  background = "dark",
  ignorecase = true,
  foldlevel = 99,
  wrap = false,
  swapfile = false,
  signcolumn = "number",
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2
}

for k, v in pairs(optionList) do
  vim.opt[k] = v
end

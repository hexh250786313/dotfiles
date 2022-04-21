-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/hexh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/hexh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/hexh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/hexh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hexh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["bufferline.nvim"] = {
    config = { 'require("plugin.bufferline")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["coc.nvim"] = {
    config = { 'require("plugin.coc")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["conflict-marker.vim"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/conflict-marker.vim",
    url = "https://github.com/rhysd/conflict-marker.vim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["defx-git"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/defx-git",
    url = "https://github.com/kristijanhusak/defx-git"
  },
  ["defx-icons"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/defx-icons",
    url = "https://github.com/kristijanhusak/defx-icons"
  },
  ["defx.nvim"] = {
    config = { 'require("plugin.defx")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/defx.nvim",
    url = "https://github.com/Shougo/defx.nvim"
  },
  ["diffview.nvim"] = {
    config = { 'require("plugin.diffview")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["formatter.nvim"] = {
    config = { 'require("plugin.formatter")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["hop.nvim"] = {
    config = { 'require("plugin.hop")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { 'require("plugin.indent-blankline")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("plugin.lualine")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { 'require("plugin.markdown-preview")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { 'require("plugin.neoscroll")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  nerdcommenter = {
    config = { 'require("plugin.nerdcommenter")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-treesitter"] = {
    config = { 'require("plugin.treesitter")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { 'require("plugin.pretty-fold")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  ["telescope-coc.nvim"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/telescope-coc.nvim",
    url = "https://github.com/fannheyward/telescope-coc.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require("plugin.telescope")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { 'require("plugin.toggleterm")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-barbaric"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/vim-barbaric",
    url = "https://github.com/rlue/vim-barbaric"
  },
  ["vim-code-dark"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/vim-code-dark",
    url = "https://github.com/tomasiser/vim-code-dark"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/vim-cool",
    url = "https://github.com/romainl/vim-cool"
  },
  ["vim-expand-region"] = {
    config = { 'require("plugin.vim-expand-region")' },
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-fugitive"] = {
    commands = { "Git" },
    config = { 'require("plugin.fugitive")' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/home/hexh/.local/share/nvim/site/pack/packer/start/vim-visual-star-search",
    url = "https://github.com/bronson/vim-visual-star-search"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
require("plugin.pretty-fold")
time([[Config for pretty-fold.nvim]], false)
-- Config for: defx.nvim
time([[Config for defx.nvim]], true)
require("plugin.defx")
time([[Config for defx.nvim]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
require("plugin.coc")
time([[Config for coc.nvim]], false)
-- Config for: markdown-preview.nvim
time([[Config for markdown-preview.nvim]], true)
require("plugin.markdown-preview")
time([[Config for markdown-preview.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
require("plugin.diffview")
time([[Config for diffview.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("plugin.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: vim-expand-region
time([[Config for vim-expand-region]], true)
require("plugin.vim-expand-region")
time([[Config for vim-expand-region]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
require("plugin.formatter")
time([[Config for formatter.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require("plugin.toggleterm")
time([[Config for toggleterm.nvim]], false)
-- Config for: nerdcommenter
time([[Config for nerdcommenter]], true)
require("plugin.nerdcommenter")
time([[Config for nerdcommenter]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
require("plugin.hop")
time([[Config for hop.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require("plugin.neoscroll")
time([[Config for neoscroll.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require("plugin.indent-blankline")
time([[Config for indent-blankline.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require("plugin.lualine")
time([[Config for lualine.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
require("plugin.bufferline")
time([[Config for bufferline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

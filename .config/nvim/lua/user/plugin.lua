local fn = vim.fn

local packer_install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(packer_install_path)) > 0 then
  PACKER_BOOTSTRAP =
    fn.system(
    {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      packer_install_path
    }
  )
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd(
  [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugin.lua source <afile> | PackerSync
    augroup end
]]
)

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({display = {open_cmd = "tabedit"}})

return packer.startup(
  function(use)
    use(
      {
        "lewis6991/impatient.nvim",
        config = function()
          require("impatient").enable_profile()
        end
      }
    )

    use({"wbthomason/packer.nvim"})

    use({"tomasiser/vim-code-dark"})

    use({"hoob3rt/lualine.nvim", config = [[require("plugin.lualine")]]})

    use({"akinsho/bufferline.nvim", config = [[require("plugin.bufferline")]]})

    use({"nvim-lua/plenary.nvim"})

    use(
      {
        "Shougo/defx.nvim",
        run = ":UpdateRemotePlugins",
        config = [[require("plugin.defx")]]
      }
    )

    use({"kristijanhusak/defx-icons"})

    use({"kristijanhusak/defx-git"})

    use({"p00f/nvim-ts-rainbow"})

    use(
      {
        "nvim-treesitter/nvim-treesitter",
        event = "BufEnter",
        run = ":TSUpdate",
        config = [[require("plugin.nvim-treesitter")]]
      }
    )

    use({"tpope/vim-surround"})

    use({"honza/vim-snippets"})

    use({"rhysd/conflict-marker.vim"})

    use({"preservim/nerdcommenter", config = [[require("plugin.nerdcommenter")]]})

    use({"mg979/vim-visual-multi", config = [[require("plugin.vim-visual-multi")]]})

    use({"kyazdani42/nvim-web-devicons"})

    use(
      {
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        ft = {"markdown"},
        config = [[require("plugin.markdown-preview")]]
      }
    )

    use({"phaazon/hop.nvim", cmd = {"HopChar1"}, config = [[require("plugin.hop")]]})

    use({"nvim-telescope/telescope.nvim", config = [[require("plugin.telescope")]]})

    use({"fannheyward/telescope-coc.nvim"})

    use({"akinsho/toggleterm.nvim", config = [[require("plugin.toggleterm")]]})

    use({"nvim-treesitter/playground"})

    use({"terryma/vim-expand-region", config = [[require("plugin.vim-expand-region")]]})

    use({"antoinemadec/FixCursorHold.nvim"})

    use({"bronson/vim-visual-star-search"})

    use({"romainl/vim-cool"})

    use({"kevinhwang91/nvim-bqf"})

    use({"anuvyklack/pretty-fold.nvim", config = [[require("plugin.pretty-fold")]]})

    use({"karb94/neoscroll.nvim", config = [[require("plugin.neoscroll")]]})

    use({"github/copilot.vim"})

    use({"lukas-reineke/indent-blankline.nvim", config = [[require("plugin.indent-blankline")]]})

    use({"mhartington/formatter.nvim", cmd = {"Formatter"}, config = [[require("plugin.formatter")]]})

    use(
      {"sindrets/diffview.nvim", cmd = {"DiffviewFileHistory", "DiffviewOpen"}, config = [[require("plugin.diffview")]]}
    )

    use({"neoclide/coc.nvim", branch = "release", config = [[require("plugin.coc")]]})

    use({"tpope/vim-fugitive", cmd = {"Git"}, config = [[require("plugin.vim-fugitive")]]})

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end
)

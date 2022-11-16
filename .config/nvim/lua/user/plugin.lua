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
-- vim.cmd(
-- [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugin.lua source <afile> | PackerSync
-- augroup end
-- ]]
-- )

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init(
  {
    display = {open_cmd = "tabedit"}
    -- git = {
    -- subcommands = {
    -- -- default: "checkout %s --", 强行切分支, 无视本地修改, 为了 hack coc
    -- checkout = "checkout -f %s --"
    -- }
    -- }
  }
)

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

    -- Theme
    use(
      {
        -- "hexh250786313/vscode.nvim"
        "sainnhe/gruvbox-material"
        -- "sainnhe/everforest"
        -- "wuelnerdotexe/vim-enfocado"
      }
    )
    -- Theme End

    use({"moll/vim-bbye", keys = {{"n", "<space>bd"}}, cmd = "Bdelete", config = [[require("plugin.vim-bbye")]]})

    use({"hoob3rt/lualine.nvim", config = [[require("plugin.lualine")]]})

    -- use({"akinsho/bufferline.nvim", config = [[require("plugin.bufferline")]]})

    use({"nvim-lua/plenary.nvim"})

    use(
      {
        "Shougo/defx.nvim",
        keys = {
          {"n", "<space>fo"},
          {"n", "<space>fr"}
        },
        cmd = {"Defx"},
        -- run = ":UpdateRemotePlugins",
        config = [[require("plugin.defx")]]
      }
    )

    use({"hexh250786313/defx-icons", after = "defx.nvim"})

    use(
      {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = [[require("plugin.nvim-treesitter")]]
      }
    )

    use({"p00f/nvim-ts-rainbow"})

    use(
      {
        "lukas-reineke/indent-blankline.nvim",
        config = [[require("plugin.indent-blankline")]]
      }
    )

    use(
      {
        "tpope/vim-surround",
        keys = {
          {"n", "vi"},
          {"n", "va"},
          {"n", "cs"},
          {"n", "ds"},
          {"v", "S"}
        }
      }
    )

    use({"honza/vim-snippets"})

    use(
      {
        "numToStr/Comment.nvim",
        keys = {
          {"n", "<space>cl"},
          {"n", "<space>cy"},
          {"n", "<space>cs"},
          {"v", "<space>cl"},
          {"v", "<space>cy"},
          {"v", "<space>cs"}
        },
        config = [[require("plugin.Comment")]]
      }
    )

    use({"kyazdani42/nvim-web-devicons"})

    use({"phaazon/hop.nvim", cmd = {"HopChar1"}, keys = {{"n", "f"}, {"v", "f"}}, config = [[require("plugin.hop")]]})

    use(
      {
        "akinsho/toggleterm.nvim",
        config = [[require("plugin.toggleterm")]]
      }
    )

    use({"nvim-treesitter/playground", cmd = {"TSHighlightCapturesUnderCursor"}})

    use(
      {
        "terryma/vim-expand-region",
        keys = {
          {"x", "v"},
          {"x", "V"}
        },
        config = [[require("plugin.vim-expand-region")]]
      }
    )

    use({"AndrewRadev/linediff.vim", cmd = {"Linediff"}})

    use({"bronson/vim-visual-star-search", keys = {{"n", "*"}, {"v", "*"}}})

    use({"kevinhwang91/nvim-bqf", config = [[require("plugin.nvim-bqf")]], requires = "junegunn/fzf"})

    use({"junegunn/fzf", config = [[require("plugin.fzf")]]})

    use(
      {
        "gelguy/wilder.nvim",
        config = [[require("plugin.wilder")]],
        event = "CmdlineEnter"
        -- run = ":UpdateRemotePlugins",
      }
    )

    use(
      {
        "mhartington/formatter.nvim",
        keys = {
          {"n", "<space>bf"}
        },
        config = [[require("plugin.formatter")]]
      }
    )

    use(
      {
        "sindrets/diffview.nvim",
        cmd = {"DiffviewFileHistory", "DiffviewOpen"},
        keys = {{"n", "<space>gt"}, {"n", "<space>gg"}, {"n", "<space>gT"}},
        config = [[require("plugin.diffview")]]
      }
    )

    use(
      {
        "https://gitlab.com/yorickpeterse/nvim-window.git",
        config = [[require("plugin.nvim-window")]]
      }
    )

    -- use({"romainl/vim-cool"})

    use(
      {
        "petertriho/nvim-scrollbar",
        config = [[require("plugin.nvim-scrollbar")]]
      }
    )

    use(
      {
        "RRethy/vim-hexokinase",
        config = [[require("plugin.vim-hexokinase")]],
        run = "make hexokinase"
      }
    )

    use(
      {
        "neoclide/coc.nvim",
        -- "~/workspace/coc.nvim",
        -- branch = "release",
        config = [[require("plugin.coc")]],
        -- run = 'perl -0777 -i -pe \'s/if\\(t==\\"\\<plug\\>\\"\\|\\|this\\.plugTs&&o-this\\.plugTs<20\\)\\{this\\.plugTs=o;return\\}/if\\(o-this\\.plugTs\\<50\\)\\{return;\\}else\\{this\\.plugTs=o;\\}/g\' ./build/index.js'
        run = "yarn install --frozen-lockfile && /home/hexh/workspace/dotfiles/.config/nvim/lua/hook/postinstall/coc.sh",
        event = "CursorHold",
        after = "nvim-autopairs"
      }
    )

    -- debug
    -- use(
    --   {
    --     "~/workspace/coc.nvim",
    --     config = function()
    --       require("plugin.coc")
    -- --       vim.cmd("let g:coc_node_args = ['--nolazy', '--inspect=6045']")
    --     end,
    --     run = "yarn install --frozen-lockfile && /home/hexh/workspace/dotfiles/.config/nvim/lua/hook/postinstall/coc.sh",
    --     event = "CursorHold",
    --     after = "nvim-autopairs"
    --   }
    -- )

    use(
      {
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
        config = [[require("plugin.nvim-ufo")]],
        cmd = "UfoEnable"
      }
    )

    use(
      {
        "tpope/vim-fugitive",
        cmd = {"Git"},
        keys = {{"n", "<space>gG"}, {"n", "<space>gc"}},
        config = [[require("plugin.vim-fugitive")]]
      }
    )

    use(
      {
        "nvim-pack/nvim-spectre",
        keys = {{"n", "<space>sg"}, {"v", "<space>sg"}},
        config = [[require("plugin.nvim-spectre")]],
        run = "./build.sh"
      }
    )

    use(
      {
        "gbprod/yanky.nvim",
        config = [[require("plugin.yanky")]]
      }
    )

    use({"gpanders/editorconfig.nvim"})

    use({"xiyaowong/nvim-cursorword"})

    use(
      {
        "skywind3000/asynctasks.vim",
        requires = "skywind3000/asyncrun.vim",
        config = [[require("plugin.asynctasks")]]
      }
    )

    use(
      {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup {}
        end
      }
    )

    use({"dstein64/vim-startuptime", cmd = "StartupTime", config = [[vim.g.startuptime_tries = 10]]})

    use({"kevinhwang91/nvim-hlslens", config = [[require("plugin.nvim-hlslens")]]})

    use({"klen/nvim-config-local", config = [[require("plugin.nvim-config-local")]]})

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end
)

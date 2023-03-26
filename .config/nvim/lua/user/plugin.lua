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
    display = {open_cmd = "tabedit"},
    git = {
      subcommands = {
        -- default: "checkout %s --", 强行切分支, 无视本地修改, 为了 hack coc
        checkout = "checkout -f %s --"
      }
    }
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

    ---------> Buffer Module
    use(
      {
        "moll/vim-bbye",
        keys = {{"n", "<leader>bd"}},
        cmd = "Bdelete",
        config = [[require("modules.buffer.plugins.vim-bbye")]]
      }
    )
    use({"akinsho/bufferline.nvim", config = [[require("modules.buffer.plugins.bufferline")]]})
    use(
      {
        "~/.config/nvim/_self/plugins/delete-all-buffers",
        config = [[require("modules.buffer.plugins.delete-all-buffers")]],
        keys = {{"n", "<leader>bD"}}
      }
    )

    ---------> Code Module
    use(
      {
        "mhartington/formatter.nvim",
        keys = {
          {"n", "<leader>cf"},
          {"x", "<leader>cf"}
        },
        config = [[require("modules.code.plugins.formatter")]]
      }
    )
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
        config = [[require("modules.code.plugins.Comment")]]
      }
    )

    ---------> File Module
    use(
      {
        "Shougo/defx.nvim",
        keys = {
          {"n", "<space>e"},
          {"n", "<space>E"}
        },
        cmd = {"Defx"},
        config = function()
          require("modules.file.plugins.defx-tab")
          vim.cmd("ConfigSource")
        end
      }
    )
    use({"hexh250786313/defx-icons", after = "defx.nvim"})
    use({"junegunn/fzf", config = [[require("modules.file.plugins.fzf")]]})

    ---------> Highlight Module
    use(
      {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        commit = "9bfaf62e42bdcd042df1230e9188487e62a112c0",
        config = [[require("modules.highlight.plugins.nvim-treesitter")]]
      }
    )
    use({"nvim-treesitter/playground", cmd = {"TSHighlightCapturesUnderCursor"}})
    use(
      {
        "RRethy/vim-hexokinase",
        config = [[require("modules.highlight.plugins.vim-hexokinase")]],
        run = "make hexokinase"
      }
    )
    use(
      {
        "lukas-reineke/indent-blankline.nvim",
        config = [[require("modules.highlight.plugins.indent-blankline")]]
      }
    )
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

    use({"kevinhwang91/nvim-bqf", config = [[require("plugin.nvim-bqf")]], requires = "junegunn/fzf"})

    use({"hoob3rt/lualine.nvim", config = [[require("plugin.lualine")]]})

    use({"nvim-lua/plenary.nvim"})

    -- use({"p00f/nvim-ts-rainbow"})

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

    use({"honza/vim-snippets", after = "coc.nvim"})

    use({"kyazdani42/nvim-web-devicons"})

    use({"phaazon/hop.nvim", cmd = {"HopChar1"}, keys = {{"n", "f"}, {"v", "f"}}, config = [[require("plugin.hop")]]})

    use(
      {
        "akinsho/toggleterm.nvim",
        config = [[require("plugin.toggleterm")]]
      }
    )

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
        "hexh250786313/diffview.nvim",
        cmd = {"DiffviewFileHistory", "DiffviewOpen"},
        keys = {{"n", "<space>gt"}, {"n", "<space>gg"}, {"n", "<space>gT"}},
        config = [[require("plugin.diffview")]]
      }
    )

    use(
      {
        "https://gitlab.com/yorickpeterse/nvim-window.git",
        config = [[require("plugin.nvim-window")]],
        keys = {{"n", "<space>ww"}},
        after = "defx.nvim"
      }
    )

    -- use(
    --   {
    --     "petertriho/nvim-scrollbar",
    --     config = [[require("plugin.nvim-scrollbar")]]
    --   }
    -- )

    use(
      {
        "neoclide/coc.nvim",
        branch = "master",
        config = [[require("plugin.coc")]],
        run = "yarn install --frozen-lockfile",
        event = "User ConfigFinished"
      }
    )

    use(
      {
        "kevinhwang91/nvim-ufo",
        config = [[require("plugin.nvim-ufo")]],
        -- cmd = "UfoEnable",
        requires = {
          "kevinhwang91/promise-async",
          {
            "luukvbaal/statuscol.nvim",
            config = function()
              local builtin = require("statuscol.builtin")
              vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
              require("statuscol").setup(
                {
                  relculright = true,
                  segments = {
                    {text = {builtin.foldfunc, " "}, click = "v:lua.ScFa"},
                    {text = {"%s"}, click = "v:lua.ScSa"},
                    {text = {builtin.lnumfunc}, click = "v:lua.ScLa"},
                    {text = {" "}}
                  }
                }
              )
              -- vim.o.statuscolumn = "%@v:lua.ScFa@%C%T%@v:lua.ScSa@%s%T@v:lua.ScLa@%=%l%T"
            end
          }
        }
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

    -- use(
    --   {
    --     "gbprod/yanky.nvim",
    --     config = [[require("plugin.yanky")]]
    --   }
    -- )

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

    -- use({"kevinhwang91/nvim-hlslens", config = [[require("plugin.nvim-hlslens")]]})

    use({"hexh250786313/vim-cool", config = [[require("plugin.vim-cool")]]})

    use({"karb94/neoscroll.nvim", config = [[require("plugin.neoscroll")]]})

    use({"junegunn/vim-easy-align", config = [[require("plugin.vim-easy-align")]]})

    use {
      "folke/which-key.nvim",
      config = [[require("plugin.which-key")]]
    }

    use(
      {
        "klen/nvim-config-local",
        config = [[require("plugin.nvim-config-local")]],
        after = {
          -- "vscode.nvim",
          "gruvbox-material",
          -- "everforest",
          -- "vim-enfocado",
          "lualine.nvim",
          "plenary.nvim",
          "nvim-treesitter",
          "indent-blankline.nvim",
          "nvim-web-devicons",
          "toggleterm.nvim",
          "nvim-bqf",
          "fzf",
          -- "nvim-scrollbar",
          "vim-hexokinase",
          -- "yanky.nvim",
          "editorconfig.nvim",
          "nvim-cursorword",
          "asynctasks.vim",
          "nvim-autopairs",
          "vim-cool"
        }
      }
    )

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end
)

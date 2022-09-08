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
      }
    )
    -- Theme End

    use({"moll/vim-bbye", keys = {{"n", "<space>bd"}}, cmd = "Bdelete", config = [[require("plugin.vim-bbye")]]})

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

    -- use({"kristijanhusak/defx-icons"})
    -- use({"~/workspace/defx-icons"})
    use({"hexh250786313/defx-icons"})

    use({"kristijanhusak/defx-git"})

    use({"p00f/nvim-ts-rainbow"})

    use(
      {
        "nvim-treesitter/nvim-treesitter",
        commit = "2a63ea5665a6de96acd31a045d9d4d73272ff5a9",
        event = "BufEnter",
        run = ":TSUpdate",
        config = [[require("plugin.nvim-treesitter")]]
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

    -- use({"akinsho/git-conflict.nvim", config = [[require("plugin.git-conflict")]]})
    -- use({"hexh250786313/git-conflict.nvim", config = [[require("plugin.git-conflict")]]})
    use({"rhysd/conflict-marker.vim"})
    -- use({"~/workspace/git-conflict.nvim", config = [[require("plugin.git-conflict")]]})

    use(
      {
        "preservim/nerdcommenter",
        keys = {
          {"n", "<space>cl"},
          {"n", "<space>cy"},
          {"n", "<space>cs"},
          {"n", "<space>cu"},
          {"v", "<space>cl"},
          {"v", "<space>cy"},
          {"v", "<space>cs"},
          {"v", "<space>cu"}
        },
        config = [[require("plugin.nerdcommenter")]]
      }
    )

    use(
      {
        "mg979/vim-visual-multi",
        config = [[require("plugin.vim-visual-multi")]]
      }
    )

    use({"kyazdani42/nvim-web-devicons"})

    use({"phaazon/hop.nvim", cmd = {"HopChar1"}, keys = {{"n", "f"}, {"v", "f"}}, config = [[require("plugin.hop")]]})

    use(
      {
        "nvim-telescope/telescope.nvim",
        keys = {
          {"n", "<space>sf"},
          -- {"n", "<space>sg"},
          {"n", "<space>sr"},
          {"n", "<space>["},
          {"n", "<space>]"},
          {"n", "<C-LeftMouse>"},
          {"v", "<space>sf"},
          -- {"v", "<space>sg"}
          {"n", "<space>sb"},
          {"n", "<space>sy"}
        },
        config = [[require("plugin.telescope")]]
      }
    )

    -- use({"fannheyward/telescope-coc.nvim"})
    use({"hexh250786313/telescope-coc.nvim"})
    -- use({"~/workspace/telescope-coc.nvim"})

    use(
      {
        "akinsho/toggleterm.nvim",
        keys = {
          {"n", "<space>gl"},
          {"n", "<space>gw"},
          {"n", "<c-t>"}
        },
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

    use({"antoinemadec/FixCursorHold.nvim"})

    use({"AndrewRadev/linediff.vim", cmd = {"Linediff"}})

    use({"bronson/vim-visual-star-search", keys = {{"n", "*"}, {"v", "*"}}})

    use({"kevinhwang91/nvim-bqf", config = [[require("plugin.nvim-bqf")]], requires = "junegunn/fzf"})

    use(
      {
        "anuvyklack/fold-preview.nvim",
        config = [[require("plugin.fold-preview")]],
        requires = "anuvyklack/keymap-amend.nvim"
      }
    )

    -- use({"karb94/neoscroll.nvim", config = [[require("plugin.neoscroll")]]})

    use({"github/copilot.vim", config = [[require("plugin.copilot")]], cmd = {"Copilot"}})

    use({"gelguy/wilder.nvim", run = ":UpdateRemotePlugins", config = [[require("plugin.wilder")]]})

    use({"lukas-reineke/indent-blankline.nvim", config = [[require("plugin.indent-blankline")]]})

    use(
      {
        "mhartington/formatter.nvim",
        cmd = {"Format", "FormatWrite"},
        keys = {{"n", "<space>bf"}, {"x", "<space>bf"}},
        config = [[require("plugin.formatter")]]
      }
    )

    use(
      {
        "sindrets/diffview.nvim",
        cmd = {"DiffviewFileHistory", "DiffviewOpen"},
        keys = {{"n", "<space>gt"}, {"n", "<space>gG"}, {"n", "<space>gT"}},
        config = [[require("plugin.diffview")]]
      }
    )

    use(
      {
        "https://gitlab.com/yorickpeterse/nvim-window.git",
        config = [[require("plugin.nvim-window")]]
      }
    )

    use({"romainl/vim-cool"})

    -- use({"dstein64/nvim-scrollview", config = [[require("plugin.nvim-scrollview")]]})
    use(
      {
        "petertriho/nvim-scrollbar",
        config = function()
          require("scrollbar").setup(
            {
              excluded_filetypes = {
                "list",
                "spectre_panel",
                "defx",
                "prompt",
                "TelescopePrompt"
              },
              set_highlights = false,
              marks = {
                Error = {
                  text = {"∎", "∎"},
                  priority = 1
                },
                Warn = {
                  text = {"∎", "∎"},
                  priority = 2
                },
                Info = {
                  text = {"∎", "∎"},
                  priority = 3
                },
                Hint = {
                  text = {"∎", "∎"},
                  priority = 4
                },
                Misc = {
                  text = {"∎", "∎"},
                  priority = 5
                }
              }
            }
          )
        end
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
        -- branch = "release",
        config = [[require("plugin.coc")]],
        -- run = 'perl -0777 -i -pe \'s/if\\(t==\\"\\<plug\\>\\"\\|\\|this\\.plugTs&&o-this\\.plugTs<20\\)\\{this\\.plugTs=o;return\\}/if\\(o-this\\.plugTs\\<50\\)\\{return;\\}else\\{this\\.plugTs=o;\\}/g\' ./build/index.js'
        run = "yarn install --frozen-lockfile && /home/hexh/workspace/dotfiles/.config/nvim/lua/hook/postinstall/coc.sh"
      }
    )

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
        keys = {{"n", "<space>gg"}, {"n", "<space>gc"}},
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
        config = function()
          require("yanky").setup({})
          vim.keymap.set({"n", "x"}, "y", "<Plug>(YankyYank)")
          vim.keymap.set({"n", "x"}, "p", "<Plug>(YankyPutAfter)")
          vim.keymap.set({"n", "x"}, "P", "<Plug>(YankyPutBefore)")
          -- vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
          -- vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
          -- vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
          -- vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
        end
      }
    )

    use({"gpanders/editorconfig.nvim"})

    -- use(
    -- {
    -- "levouh/tint.nvim",
    -- config = function()
    -- require("tint").setup()
    -- end
    -- }
    -- )

    -- use({"https://git.sr.ht/~whynothugo/lsp_lines.nvim"})

    use({"dstein64/vim-startuptime", cmd = "StartupTime", config = [[vim.g.startuptime_tries = 10]]})

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end
)

local fn = vim.fn

local packer_install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(packer_install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = { open_cmd = "tabedit" },
  git = {
    subcommands = {
      -- default: "checkout %s --", 强行切分支, 无视本地修改, 为了 hack coc
      checkout = "checkout -f %s --",
    },
  },
})

return packer.startup(function(use)
  -- ┌───────────────────────────────────────
  -- │  Base Module
  -- └───────────────────────────────────────
  use({
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient").enable_profile()
    end,
  })
  use({ "wbthomason/packer.nvim" })
  use({ "dstein64/vim-startuptime", cmd = "StartupTime", config = [[vim.g.startuptime_tries = 10]] })
  use({ "kevinhwang91/nvim-bqf", config = [[require("modules.base.plugins.nvim-bqf")]], requires = "junegunn/fzf" })
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "akinsho/toggleterm.nvim", config = [[require("modules.base.plugins.toggleterm")]] })
  use({ "gelguy/wilder.nvim", config = [[require("modules.base.plugins.wilder")]], event = "CmdlineEnter" })
  use({
    "kevinhwang91/nvim-ufo",
    config = [[require("modules.base.plugins.nvim-ufo")]],
    requires = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
  })
  use({ "luukvbaal/statuscol.nvim", config = [[require("modules.base.plugins.statuscol")]] })
  use({
    "skywind3000/asynctasks.vim",
    requires = "skywind3000/asyncrun.vim",
    commit = "c304a574defa426f0b660c361fa01b556dd60d4d",
    config = [[require("modules.base.plugins.asynctasks")]],
  })
  use({ "folke/which-key.nvim", config = [[require("modules.base.plugins.which-key")]] })
  use({
    "klen/nvim-config-local",
    config = [[require("modules.base.plugins.nvim-config-local")]],
    -- 插件的启动时机：
    -- a. 启动时同步加载的插件（不需要应用本地配置的插件）
    -- b. 需要使用 nvim-config-local 的插件
    --   b.1 应用 ConfigFinished 事件的，如 coc
    --   b.2 调用 ConfigFinished 的，如 defx
    -- 如果怕本地配置被插件覆盖，则把插件配置进 after 中
    -- after = {"lualine.nvim"}
  })
  use({
    "~/.config/nvim/_self/plugins/close-all-windows",
    config = [[require("modules.base.plugins.close-all-windows")]],
    keys = { { "n", "<leader>qW" } },
  })
  -- use({"~/.config/nvim/_self/plugins/copy-to-clipboard", config = [[require("modules.base.plugins.copy-to-clipboard")]]})

  -- ┌───────────────────────────────────────
  -- │  Buffer Module
  -- └───────────────────────────────────────
  use({
    "moll/vim-bbye",
    keys = { { "n", "<leader>qb" } },
    cmd = "Bdelete",
    config = [[require("modules.buffer.plugins.vim-bbye")]],
  })
  -- use({"akinsho/bufferline.nvim", config = [[require("modules.buffer.plugins.bufferline")]], after = {"theme"}})
  use({ "hoob3rt/lualine.nvim", config = [[require("modules.buffer.plugins.lualine")]],
        after = { "theme", "highlight" } })
  use({
    "~/.config/nvim/_self/plugins/delete-all-buffers",
    config = [[require("modules.buffer.plugins.delete-all-buffers")]],
    keys = { { "n", "<leader>qB" } },
  })
  use("~/.config/nvim/_self/plugins/avoid-scrolling-when-switch-buffers")
  use {
    'kevinhwang91/nvim-fundo',
    requires = 'kevinhwang91/promise-async',
    run = function()
      require('fundo').install()
    end,
    config = [[require("modules.buffer.plugins.nvim-fundo")]],
  }
  use { 'lambdalisue/suda.vim', cmd = { "SudaWrite" } }
  -- use({"chrisgrieser/nvim-early-retirement", config = [[require("modules.buffer.plugins.nvim-early-retirement")]]})

  -- ┌───────────────────────────────────────
  -- │  Code Module
  -- └───────────────────────────────────────
  use({
    "mhartington/formatter.nvim",
    keys = { { "n", "<leader>cf" }, { "x", "<leader>cf" } },
    config = [[require("modules.code.plugins.formatter")]],
  })
  use({
    "numToStr/Comment.nvim",
    keys = {
      { "n", "<leader>cl" },
      { "n", "<leader>cy" },
      { "n", "<leader>cs" },
      { "v", "<leader>cl" },
      { "v", "<leader>cy" },
      { "v", "<leader>cs" },
    },
    config = [[require("modules.code.plugins.Comment")]],
  })
  use({
    "github/copilot.vim",
    -- event = "InsertEnter",
    after = "coc.nvim",
    config = [[require("modules.code.plugins.copilot")]],
  })

  -- ┌───────────────────────────────────────
  -- │  File Module
  -- └───────────────────────────────────────
  use({
    "Shougo/defx.nvim",
    keys = { { "n", "<leader>e" } },
    cmd = { "Defx" },
    config = function()
      require("modules.file.plugins.defx")
      vim.cmd("ConfigLocalSource")
    end,
  })
  use({
    "kevinhwang91/rnvimr",
    keys = { { "n", "<leader>E" } },
    cmd = { "RnvimrToggle" },
    config = [[require("modules.file.plugins.rnvimr")]],
  })
  use({ "hexh250786313/defx-icons", after = "defx.nvim", branch = "hexh" })
  use({ "~/.config/nvim/_self/plugins/port-defx-icons", after = "defx-icons" })
  use({ "junegunn/fzf", config = [[require("modules.file.plugins.fzf")]] })

  -- ┌───────────────────────────────────────
  -- │  Highlight Module
  -- └───────────────────────────────────────
  -- use({
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   after = "nvim-treesitter",
  --   requires = "nvim-treesitter/nvim-treesitter",
  -- })
  -- use({
  --   "nvim-treesitter/nvim-treesitter",
  --   run = ":TSUpdate",
  --   -- commit = "3c42fb9d702e1246313d2b5531b815595cb4d889",
  --   -- commit = "d4e48be88d9822d98c9194f5cc2778c9953afb66",
  --   config = [[require("modules.highlight.plugins.nvim-treesitter")]],
  -- })
  -- use({ "nvim-treesitter/playground", cmd = { "TSHighlightCapturesUnderCursor" } })
  use({
    "RRethy/vim-hexokinase",
    config = [[require("modules.highlight.plugins.vim-hexokinase")]],
    run = "make hexokinase",
  })
  use({ "hexh250786313/yats.vim" })
  -- use({
  --   "lukas-reineke/indent-blankline.nvim",
  --   config = [[require("modules.highlight.plugins.indent-blankline")]],
  --   commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
  --   after = "theme",
  -- })
  -- use({ "lukas-reineke/virt-column.nvim", config = [[require("modules.highlight.plugins.virt-column")]] })
  -- Theme
  use({
    -- "rockyzhang24/arctic.nvim",
    -- branch = "v2",
    "folke/tokyonight.nvim",
    -- requires = { "rktjmp/lush.nvim" },
    as = "theme",
    config = function()
      vim.cmd([[
        let g:gruvbox_material_better_performance = 1
        let g:gruvbox_material_background = 'hard'
        let g:gruvbox_material_foreground = 'original'
        set background=light " 背景 "light" | "dark"

        " ---> 主题：rockyzhang24/arctic.nvim
        " colorscheme arctic

        " ---> 主题：mcchrish/zenbones.nvim
        " colorscheme zenbones
        " autocmd VimEnter * exec 'hi! link CocMenuSel CocListLine'

        " ---> 主题：folke/tokyonight.nvim
        colorscheme tokyonight-night

        " ---> 主题：sainnhe/everforest
        " let g:everforest_better_performance = 1
        " let g:everforest_background = 'hard'
        " autocmd VimEnter * exec 'hi! link CocMenuSel CocListLine'
        " colorscheme everforest
      ]])
    end,
  })
  -- Theme End
  use({
    "~/.config/nvim/_self/plugins/highlight",
    config = [[require("modules.highlight.plugins.highlight")]],
    -- 样式相关的插件都要比这个先启动
    after = {
      "nvim-cursorword",
      -- "indent-blankline.nvim",
      -- "nvim-treesitter",
      "theme",
    },
  })

  -- ┌───────────────────────────────────────
  -- │  CoC Module
  -- └───────────────────────────────────────
  use({
    "neoclide/coc.nvim",
    branch = "master",
    config = [[require("modules.coc.config")]],
    run = "rm -rf /home/hexh/.local/share/nvim/site/pack/packer/opt/coc.nvim/build && yarn install --frozen-lockfile",
    -- 这个事件是 nvim-config-local 完成后的事件
    -- 这里要保证 coc.nvim 在本地配置加载完后才加载 coc
    event = "User ConfigLocalFinished",
  })

  -- ┌───────────────────────────────────────
  -- │  Git Module
  -- └───────────────────────────────────────
  use({
    "sindrets/diffview.nvim",
    cmd = { "DiffviewFileHistory", "DiffviewOpen" },
    keys = { { "n", "<leader>gt" }, { "n", "<leader>gT" }, { "n", "<leader>gG" } },
    config = [[require("modules.git.plugins.diffview")]],
  })
  use({
    "tpope/vim-fugitive",
    cmd = { "Git" },
    keys = { { "n", "<leader>gg" } },
    config = [[require("modules.git.plugins.vim-fugitive")]],
  })

  -- ┌───────────────────────────────────────
  -- │  Text Module
  -- └───────────────────────────────────────
  use({
    "terryma/vim-expand-region",
    keys = { { "x", "v" }, { "x", "V" } },
    config = [[require("modules.text.plugins.vim-expand-region")]],
  })
  use({ "junegunn/vim-easy-align", keys = { { "x", "ga" } },
        config = [[require("modules.text.plugins.vim-easy-align")]] })
  use({ "tpope/vim-surround", keys = { { "n", "vi" }, { "n", "va" }, { "n", "cs" }, { "n", "ds" }, { "x", "S" } } })
  use({ "AndrewRadev/linediff.vim", cmd = { "Linediff" } })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  })
  use({ "xiyaowong/nvim-cursorword" })

  -- ┌───────────────────────────────────────
  -- │  Grep Module
  -- └───────────────────────────────────────
  use({
    "nvim-pack/nvim-spectre",
    keys = { { "n", "<leader>/" }, { "x", "<leader>/" } },
    -- keys = { { "n", "<leader>?" }, { "x", "<leader>?" } },
    config = [[require("modules.grep.plugins.nvim-spectre")]],
    run = "./build.sh",
  })
  use({ "hexh250786313/vim-cool", config = [[require("modules.grep.plugins.vim-cool")]] })
  use({ "bronson/vim-visual-star-search", keys = { { "n", "*" }, { "v", "*" } } })
  use({
    "ggVGc/vim-fuzzysearch",
    cmd = "FuzzySearch",
    keys = { { "n", "?" } },
    config = [[require("modules.grep.plugins.vim-fuzzysearch")]],
  })

  -- ┌───────────────────────────────────────
  -- │  Motion Module
  -- └───────────────────────────────────────
  use({
    "phaazon/hop.nvim",
    cmd = { "HopChar1" },
    keys = { { "n", "f" }, { "v", "f" } },
    config = [[require("modules.motion.plugins.hop")]],
  })
  use({
    "yorickpeterse/nvim-window",
    config = [[require("modules.motion.plugins.nvim-window")]],
    keys = { { "n", "<leader>ww" } },
    -- after = "defx.nvim"
  })
  use({ "karb94/neoscroll.nvim", config = [[require("modules.motion.plugins.neoscroll")]] })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

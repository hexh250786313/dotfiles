local fn = vim.fn

local theme_config = require("modules.highlight.themes.__theme-config")
local theme = theme_config.get_current_theme()

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
  use({ "wbthomason/packer.nvim" })
  use({ "dstein64/vim-startuptime", cmd = "StartupTime", config = [[vim.g.startuptime_tries = 10]] })
  use({ "kevinhwang91/nvim-bqf", config = [[require("modules.base.plugins.nvim-bqf")]], requires = "~/.fzf" })
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
    config = [[require("modules.base.plugins.asynctasks")]],
  })
  use({
    "folke/which-key.nvim",
    config = [[require("modules.base.plugins.which-key")]],
    commit = "0539da005b98b02cf730c1d9da82b8e8edb1c2d2",
  })
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
  use({ "rcarriga/nvim-notify", config = [[require("modules.base.plugins.nvim-notify")]] })
  use({ "MunifTanjim/nui.nvim" })
  -- use({ "stevearc/dressing.nvim" })
  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = [[require("modules.base.plugins.noice")]],
  })

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
  use({
    "hoob3rt/lualine.nvim",
    config = [[require("modules.buffer.plugins.lualine")]],
    after = { "theme", "highlight" },
  })
  use({
    "~/.config/nvim/_self/plugins/delete-all-buffers",
    config = [[require("modules.buffer.plugins.delete-all-buffers")]],
    keys = { { "n", "<leader>qB" } },
  })
  use("~/.config/nvim/_self/plugins/avoid-scrolling-when-switch-buffers")
  use({
    "kevinhwang91/nvim-fundo",
    requires = "kevinhwang91/promise-async",
    run = function()
      require("fundo").install()
    end,
    config = [[require("modules.buffer.plugins.nvim-fundo")]],
  })
  use({ "lambdalisue/suda.vim", cmd = { "SudaWrite" } })
  -- use({"chrisgrieser/nvim-early-retirement", config = [[require("modules.buffer.plugins.nvim-early-retirement")]]})

  -- ┌───────────────────────────────────────
  -- │  Code Module
  -- └───────────────────────────────────────
  use({
    "mhartington/formatter.nvim",
    keys = { { "x", "<leader>cf" } },
    -- event = "User ConfigLocalFinished",
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
    -- event = "InsertEnter", -- 不能懒加载，否则插件的 maptab 会先于配置执行，导致 copilot_no_maps 不生效
    -- after = "coc.nvim", -- 不能懒加载，否则插件的 maptab 会先于配置执行，导致 copilot_no_maps 不生效
    -- 或者可以把配置放到 options 去，不过不太好
    config = [[require("modules.code.plugins.copilot")]],
  })
  use({
    "CopilotC-Nvim/CopilotChat.nvim",
    -- branch = "canary",
    requires = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    cmd = { "CopilotChatChinese" },
    after = "copilot.vim",
    config = [[require("modules.code.plugins.CopilotChat")]],
  })
  -- use({
  --   "yetone/avante.nvim",
  --   config = [[require("modules.code.plugins.avante")]],
  --   requires = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   keys = {
  --     { "n", "<leader>ca" },
  --     { "x", "<leader>ca" },
  --     { "n", "<leader>ce" },
  --     { "x", "<leader>ce" },
  --     { "n", "<leader>cr" },
  --   },
  --   run = "make BUILD_FROM_SOURCE=true",
  --   after = { "theme", "highlight" },
  -- })

  -- ┌───────────────────────────────────────
  -- │  File Module
  -- └───────────────────────────────────────
  use({
    "hexh250786313/defx.nvim",
    keys = { { "n", "<leader>e" } },
    cmd = { "Defx" },
    config = function()
      if vim.fn.has("wsl") == 1 then
        require("modules.file.plugins.defx-wsl")
      else
        require("modules.file.plugins.defx")
      end
      vim.cmd("ConfigLocalSource")
    end,
  })
  use({
    "kevinhwang91/rnvimr",
    keys = { { "n", "<leader>E" } },
    cmd = { "RnvimrToggle" },
    config = [[require("modules.file.plugins.rnvimr")]],
  })
  -- use({
  --   "mikavilpas/yazi.nvim",
  --   keys = { { "n", "<leader>E" } },
  --   cmd = { "Yazi" },
  --   config = [[require("modules.file.plugins.yazi")]],
  -- })
  use({ "hexh250786313/defx-icons", after = "defx.nvim", branch = "hexh" })
  use({ "~/.config/nvim/_self/plugins/port-defx-icons", after = "defx-icons" })

  -- ┌───────────────────────────────────────
  -- │  Highlight Module
  -- └───────────────────────────────────────
  -- use({
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   after = "nvim-treesitter",
  --   requires = "nvim-treesitter/nvim-treesitter",
  -- })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = [[require("modules.highlight.plugins.nvim-treesitter")]],
  })
  use({ "nvim-treesitter/playground", cmd = { "TSHighlightCapturesUnderCursor" } })
  -- use({
  --   "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
  --   requires = { "nvim-treesitter/nvim-treesitter" },
  --   config = [[require("modules.highlight.plugins.rainbow-delimiters")]],
  -- })
  -- use({ "hexh250786313/yats.vim" })
  -- use({ "hexh250786313/vim-svelte-plugin" })
  use({
    "NvChad/nvim-colorizer.lua",
    cmd = { "ColorizerToggle" },
    config = [[require("modules.highlight.plugins.nvim-colorizer")]],
  })
  -- use({ "lukas-reineke/virt-column.nvim", config = [[require("modules.highlight.plugins.virt-column")]] })
  -- Theme
  use({
    theme.name,
    branch = theme.branch,
    requires = theme.requires,
    as = "theme",
    config = function()
      theme_config = require("modules.highlight.themes.__theme-config")
      theme = theme_config.get_current_theme()
      theme.setup()
      theme.commonSetup()
    end,
  })
  -- Theme End
  use({
    "~/.config/nvim/_self/plugins/highlight",
    config = [[require("modules.highlight.plugins.highlight")]],
    -- 样式相关的插件都要比这个先启动
    after = {
      -- "nvim-cursorword",
      "nvim-treesitter",
      "theme",
    },
  })

  -- ┌───────────────────────────────────────
  -- │  FZF Module
  -- └───────────────────────────────────────
  use({
    "ibhagwan/fzf-lua",
    config = [[require("modules.fzf.plugins.fzf-lua")]],
    keys = {
      { "n", "<leader>/" },
      { "x", "<leader>/" },
      { "n", "<leader>F" },
      { "n", "<leader>ld" },
      { "n", "<leader>lD" },
      { "n", "<leader>ls" },
      { "n", "<leader>aa" },
      { "n", "<leader>aA" },
      { "n", "<leader>aF" },
      { "n", "<leader>as" },
      { "n", "<leader>ar" },
      { "n", "gr" },
      { "n", "gd" },
      { "n", "gD" },
      { "n", "gi" },
      { "n", "?" },
    },
  })
  use({ "~/.fzf", as = "fzf", config = [[require("modules.fzf.plugins.fzf")]] })

  -- ┌───────────────────────────────────────
  -- │  CoC Module
  -- └───────────────────────────────────────
  use({
    "neoclide/coc.nvim",
    -- "~/workspace/hexh/coc.nvim",
    -- "hexh250786313/coc.nvim",
    config = [[require("modules.coc.config")]],
    run = "rm -rf /home/hexh/.local/share/nvim/site/pack/packer/opt/coc.nvim/build && npm ci",
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
    keys = {
      { "n", "<leader>gt" },
      { "n", "<leader>gT" },
      -- { "n", "<leader>gG" }
    },
    config = [[require("modules.git.plugins.diffview")]],
  })
  use({
    "tpope/vim-fugitive",
    cmd = { "Git" },
    -- keys = { { "n", "<leader>gg" } },
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
  use({
    "junegunn/vim-easy-align",
    keys = { { "x", "ga" } },
    config = [[require("modules.text.plugins.vim-easy-align")]],
  })
  use({ "tpope/vim-surround", keys = { { "n", "vi" }, { "n", "va" }, { "n", "cs" }, { "n", "ds" }, { "x", "S" } } })
  use({ "AndrewRadev/linediff.vim", cmd = { "Linediff" } })
  -- 在 less 中会无缘无故失效，需要重启 nvim 才行
  -- use({
  --   "windwp/nvim-autopairs",
  --   config = [[require("modules.text.plugins.nvim-autopairs")]],
  -- })
  -- 没什么缺点，但是 coc-pairs 更简单，我可以自己调试
  use({
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recommended as each new version will have breaking changes
    config = [[require("modules.text.plugins.ultimate-autopair")]],
  })
  -- use({ "xiyaowong/nvim-cursorword", config = [[ require("modules.text.plugins.nvim-cursorword") ]] })

  -- ┌───────────────────────────────────────
  -- │  Grep Module
  -- └───────────────────────────────────────
  use({
    "nvim-pack/nvim-spectre",
    -- keys = { { "n", "<leader>/" }, { "x", "<leader>/" } },
    keys = { { "n", "<leader>?" }, { "x", "<leader>?" } },
    config = [[require("modules.grep.plugins.nvim-spectre")]],
    run = "./build.sh",
  })
  use({ "hexh250786313/vim-cool", config = [[require("modules.grep.plugins.vim-cool")]] })
  -- use({ "romainl/vim-cool", config = [[require("modules.grep.plugins.vim-cool")]] })
  use({ "bronson/vim-visual-star-search", keys = { { "n", "*" }, { "v", "*" } } })
  -- use({
  --   "ggVGc/vim-fuzzysearch",
  --   cmd = "FuzzySearch",
  --   keys = { { "n", "?" } },
  --   config = [[require("modules.grep.plugins.vim-fuzzysearch")]],
  -- })

  -- ┌───────────────────────────────────────
  -- │  Motion Module
  -- └───────────────────────────────────────
  use({
    "phaazon/hop.nvim",
    cmd = { "HopChar1" },
    keys = { { "n", "f" }, { "v", "f" } },
    config = [[require("modules.motion.plugins.hop")]],
  })
  -- use({
  --   "yorickpeterse/nvim-window",
  --   config = [[require("modules.motion.plugins.nvim-window")]],
  --   keys = { { "n", "<leader>ww" } },
  --   -- after = "defx.nvim"
  -- })
  -- use({
  --   "karb94/neoscroll.nvim",
  --   config = [[require("modules.motion.plugins.neoscroll")]],
  --   commit = "21d52973bde32db998fc8b6590f87eb3c3c6d8e4",
  -- })
  -- use({
  --   "echasnovski/mini.animate",
  --   config = [[require("modules.motion.plugins.mini-animate")]],
  -- })
  use({
    "echasnovski/mini.map",
    config = [[require("modules.motion.plugins.mini-map")]],
  })

  -- ┌───────────────────────────────────────
  -- │  Markdown Module
  -- └───────────────────────────────────────
  -- use({
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   ft = { "markdown", "Avante" },
  --   config = [[require("modules.markdown.plugins.render-markdown")]],
  -- })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

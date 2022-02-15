if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'tpope/vim-surround'
  " Plug 'honza/vim-snippets'
  Plug 'rhysd/conflict-marker.vim'
  Plug 'junkblocker/git-time-lapse'
  Plug 'preservim/nerdcommenter'
  Plug 'mg979/vim-visual-multi'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'iamcco/markdown-preview.nvim'
  Plug 'phaazon/hop.nvim',
  Plug 'tomasiser/vim-code-dark',
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  " Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSInstall json lua typescript tsx javascript c markdown vim css scss' }
  Plug 'p00f/nvim-ts-rainbow'
  " Plug 'beauwilliams/focus.nvim'
  " Plug 'glepnir/indent-guides.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'nvim-treesitter/playground'
  Plug 'SmiteshP/nvim-gps'
  Plug 'terryma/vim-expand-region'
  Plug 'antoinemadec/FixCursorHold.nvim'
  Plug 'bronson/vim-visual-star-search'
  Plug 'zef/vim-cycle'
  Plug 'romainl/vim-cool'
  " Plug 'andymass/vim-matchup'
  Plug 'kevinhwang91/nvim-bqf'
  Plug 'AndrewRadev/inline_edit.vim', { 'on': 'InlineEdit' } " html 的 <script> 标签执行 InlineEdit 可以打开一个 js 缓存
  Plug 'tanvirtin/vgit.nvim',
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'anuvyklack/pretty-fold.nvim'
  Plug 'petertriho/nvim-scrollbar',
  " Plug 'dstein64/nvim-scrollview'
  Plug 'karb94/neoscroll.nvim'
  " Plug 'psliwka/vim-smoothie'
  Plug 'rlue/vim-barbaric'
  " Plug 'github/copilot.vim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'svermeulen/vim-yoink'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'onsails/lspkind-nvim'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'tami5/sqlite.lua'
  Plug 'nvim-telescope/telescope-frecency.nvim'
  Plug 'arkav/lualine-lsp-progress'
endif

call plug#end()

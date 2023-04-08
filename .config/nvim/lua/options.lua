vim.g.mapleader = " "

-- coc 的配置目录路径，需要初始化时指定，所以放在这里
vim.g.coc_config_home = "~/.config/nvim/lua/modules/coc/"

vim.cmd([[
language en_US.UTF-8
set noincsearch " / 搜索时, 在按下 <cr> 前不会乱跳
set clipboard+=unnamedplus
" let g:loaded_matchparen = 1 " 关闭括弧配对高亮
set guifont=FiraCode\ Nerd\ Font:h12
set colorcolumn=+1
let g:neovide_transparency = 0.9
]])

local myNodePath = os.getenv("MY_NODE_PATH")
vim.cmd("let $PATH = '" .. myNodePath .. "/bin:' . $PATH")

vim.g.clipboard = {
  name = "xsel_override",
  copy = {["+"] = "xsel --input --clipboard", ["*"] = "xsel --input --primary"},
  paste = {
    ["+"] = "xsel --output --clipboard",
    ["*"] = "xsel --output --primary"
  },
  cache_enabled = 1
}

local optionList = {
  mouse = "a", -- 使用鼠标
  number = true, -- 显示行号, 如果开了, 则出现丑的要命的右 padding
  relativenumber = true, -- 使用相对行号
  -- numberwidth = 2, -- 行号的宽度
  title = true, -- 任务栏显示标题
  hlsearch = true, -- 光标搜索
  -- scrolloff = 9, -- 光标滚动距离
  updatetime = 300, -- 更新时间
  cursorline = true, -- 光标行
  termguicolors = true, -- 终端
  ignorecase = true, -- 命令模式忽略大小写
  foldlevel = 99, -- 折叠级别
  wrap = true, -- 是否折行, false 的话会影响多 cols 文件的性能
  swapfile = false, -- 是否使用交换文件
  signcolumn = "auto:1", -- icon 展示在哪, "number" 为展示在行号上, "auto:1" 指的是有 icon 时展示一列, "auto:1-2" 指的是平时至少一列, 有 icon 时最多两列, "auto:2" 指的是平时没有, 有 icon 时最多两列
  lazyredraw = true, -- 执行脚本时不刷新
  wildignorecase = true, -- 弹窗忽略大小写
  -- foldmethod = "expr", -- 折叠方式
  -- foldexpr = "nvim_treesitter#foldexpr()", -- 折叠表达式
  -- 缩进相关
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  laststatus = 3, -- 状态栏全局只展示一个
  timeout = true,
  timeoutlen = 500,
  background = "dark", -- 背景 "light" | "dark"
  textwidth = 80
}

for k, v in pairs(optionList) do vim.opt[k] = v end

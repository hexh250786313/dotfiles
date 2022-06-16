vim.cmd([[
language en_US.UTF-8
set noincsearch " / 搜索时, 在按下 <cr> 前不会乱跳
]])

local optionList = {
  mouse = "a", -- 使用鼠标
  number = true, -- 显示行号
  relativenumber = true, -- 使用相对行号
  title = true, -- 任务栏显示标题
  hlsearch = true, -- 光标搜索
  scrolloff = 9, -- 光标滚动距离
  updatetime = 300, -- 更新时间
  cursorline = true, -- 光标行
  termguicolors = true, -- 终端
  ignorecase = true, -- 命令模式忽略大小写
  foldlevel = 99, -- 折叠级别
  wrap = false, -- 是否折行
  swapfile = false, -- 是否使用交换文件
  signcolumn = "number", -- icon 展示在哪 "number" 为展示在行号上
  lazyredraw = true, -- 执行脚本时不刷新
  wildignorecase = true, -- 弹窗忽略大小写
  -- foldmethod = "expr", -- 折叠方式
  -- foldexpr = "nvim_treesitter#foldexpr()", -- 折叠表达式
  -- 缩进相关
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  laststatus = 3 -- 状态栏全局只展示一个
}

for k, v in pairs(optionList) do
  vim.opt[k] = v
end

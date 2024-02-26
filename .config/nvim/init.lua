vim.loader.enable()

require("options") -- 加载配置
require("keymappings") -- 加载各个插件的快捷键
require("plugins") -- 加载插件

require("utils") -- 注册全局通用函数
require("abbrs") -- 注册缩写
require("runtime") -- 运行时配置

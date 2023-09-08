vim.loader.enable()

require("options") -- 加载配置
require("keymappings") -- 加载各个插件的快捷键
require("plugins") -- 加载插件

require("utils") -- 注册全局通用函数
require("abbrs") -- 注册缩写

-- vim.cmd([[
-- set runtimepath^=/home/hexh/.local/share/nvim/site/pack/packer/opt/defx.nvim
--
-- function! DEFX_MY_SETTINGS() abort
--   nnoremap <silent><buffer><expr> o     defx#do_action('open_tree', 'toggle')
-- endfunction
--
-- autocmd FileType defx exec 'call DEFX_MY_SETTINGS()'
-- ]])

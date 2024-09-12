#!/usr/bin/env bash

# 已经使用 hexh250786313/defx.nvim，自行维护一个独立的库，从源码直接改，不需要 hack 了
# sd "return int.*" "return int(max([x['level'] for x in context.targets])) * len(self.vars['indent'])" ~/.local/share/nvim/site/pack/packer/opt/defx.nvim/rplugin/python3/defx/column/indent.py

node ~/.config/nvim/lua/modules/base/hooks/postinstall/defx/port-nvim-web-devicons.js

#!/usr/bin/env bash

sd "return int.*" "return int(max([x['level'] for x in context.targets])) * len(self.vars['indent'])" ~/.local/share/nvim/site/pack/packer/opt/defx.nvim/rplugin/python3/defx/column/indent.py

node ~/.config/nvim/lua/modules/base/hooks/postinstall/defx/port-nvim-web-devicons.js

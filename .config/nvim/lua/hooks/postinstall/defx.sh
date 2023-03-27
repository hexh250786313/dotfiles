#!/bin/bash

sd "return int.*" "return int(max([x['level'] for x in context.targets])) * len(self.vars['indent'])" /home/hexh/.local/share/nvim/site/pack/packer/opt/defx.nvim/rplugin/python3/defx/column/indent.py

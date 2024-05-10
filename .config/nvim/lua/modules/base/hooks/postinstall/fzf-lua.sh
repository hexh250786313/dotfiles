#!/bin/zsh

src_file="$HOME/.local/share/nvim/site/pack/packer/opt/fzf-lua/lua/fzf-lua/previewer/builtin.lua"

sd '(if syntax_limit_reached > 0.*then[\s\S]*?end)' '' "$src_file"

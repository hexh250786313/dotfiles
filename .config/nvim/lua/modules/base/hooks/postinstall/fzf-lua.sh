#!/bin/zsh

src_file1="$HOME/.local/share/nvim/site/pack/packer/opt/fzf-lua/lua/fzf-lua/previewer/builtin.lua"
src_file2="$HOME/.local/share/nvim/site/pack/packer/opt/fzf-lua/lua/fzf-lua/actions.lua"

sd '(if syntax_limit_reached > 0.*then[\s\S]*?end)' '' "$src_file1"
sd 'and selected\[1\] ~= \"enter\"' 'and type(actions.enter) == "function"' "$src_file2"

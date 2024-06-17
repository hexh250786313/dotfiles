#!/bin/zsh

# 判断：是否存在 arctic 的 lualine 配置
# 如果存在，把它移到正确的位置去
# rockyzhang24/arctic
arctic_lualine="$HOME/.local/share/nvim/site/pack/packer/start/theme/extra/lualine-theme"
target_dir="$HOME/.local/share/nvim/site/pack/packer/start/theme/lua/lualine/themes"
if [[ -f $arctic_lualine/arctic.lua && ! -f $target_dir/arctic.lua ]]; then
  mkdir -p $target_dir
  mv $arctic_lualine/arctic.lua $target_dir/arctic.lua
fi

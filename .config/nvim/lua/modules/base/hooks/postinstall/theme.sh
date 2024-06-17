#!/bin/zsh
#
target_dir="$HOME/.local/share/nvim/site/pack/packer/start/theme/lua/lualine/themes"
mkdir -p $target_dir

# 判断：是否存在 arctic 的 lualine 配置
# 如果存在，把它移到正确的位置去
# rockyzhang24/arctic
arctic_lualine="$HOME/.local/share/nvim/site/pack/packer/start/theme/extra/lualine-theme/arctic.lua"
if [[ -f $arctic_lualine && ! -f $target_dir/arctic.lua ]]; then
  mv $arctic_lualine $target_dir/arctic.lua
fi

# 判断：写入 return require('ofirkai.statuslines.lualine').theme
# 如果存在，把它写入，引入正确的 lualine 配置
# ofirkai
ofirkai_lualine="$HOME/.local/share/nvim/site/pack/packer/start/theme/lua/ofirkai/statuslines/lualine.lua"
target_dir="$HOME/.local/share/nvim/site/pack/packer/start/theme/lua/lualine/themes"
if [[ -f $ofirkai_lualine && ! -f $target_dir/ofirkai.lua ]]; then
  echo "return require('ofirkai.statuslines.lualine').theme" > $target_dir/ofirkai.lua
fi

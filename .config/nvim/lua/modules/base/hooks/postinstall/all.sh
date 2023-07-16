#!/bin/zsh

cp ~/.config/nvim/lua/modules/base/hooks/postinstall/rplugin.vim ~/.local/share/nvim/

sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/defx.sh
sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/coc.sh
sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/nvim-bqf.sh
# sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/copilot.sh
sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/vim-surround.sh

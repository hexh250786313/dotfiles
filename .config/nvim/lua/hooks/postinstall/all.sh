#!/bin/zsh

cp ~/.config/nvim/lua/hooks/postinstall/rplugin.vim ~/.local/share/nvim/

sh -c ~/.config/nvim/lua/hooks/postinstall/defx.sh
sh -c ~/.config/nvim/lua/hooks/postinstall/coc.sh
sh -c ~/.config/nvim/lua/hooks/postinstall/nvim-bqf.sh

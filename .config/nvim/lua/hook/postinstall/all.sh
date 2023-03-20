#!/bin/zsh

cp ~/.config/nvim/lua/hook/postinstall/rplugin.vim /home/edwardhe/.local/share/nvim/

sh -c ~/.config/nvim/lua/hook/postinstall/defx.sh
sh -c ~/.config/nvim/lua/hook/postinstall/coc.sh
sh -c ~/.config/nvim/lua/hook/postinstall/nvim-bqf.sh

#!/bin/zsh

cp /home/hexh/workspace/dotfiles/.config/nvim/lua/hook/postinstall/rplugin.vim /home/hexh/.local/share/nvim/

sh -c /home/hexh/workspace/dotfiles/.config/nvim/lua/hook/postinstall/defx.sh
sh -c /home/hexh/workspace/dotfiles/.config/nvim/lua/hook/postinstall/coc.sh

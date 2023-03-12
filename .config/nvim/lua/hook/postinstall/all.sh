#!/bin/zsh

cp /home/edwardhe/workspace/hexh/dotfiles/.config/nvim/lua/hook/postinstall/rplugin.vim /home/edwardhe/.local/share/nvim/

sh -c /home/edwardhe/workspace/hexh/dotfiles/.config/nvim/lua/hook/postinstall/defx.sh
sh -c /home/edwardhe/workspace/hexh/dotfiles/.config/nvim/lua/hook/postinstall/coc.sh
sh -c /home/edwardhe/workspace/hexh/dotfiles/.config/nvim/lua/hook/postinstall/nvim-bqf.sh

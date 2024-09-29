#!/usr/bin/env zsh

cp ~/.config/nvim/lua/modules/base/hooks/postinstall/rplugin.vim ~/.local/share/nvim/

sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/defx/defx.sh
sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/coc.sh
sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/nvim-bqf.sh
sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/copilot.sh
sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/vim-surround.sh
sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/fzf-lua.sh
sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/theme.sh
sh -c ~/.config/nvim/lua/modules/base/hooks/postinstall/avante.sh

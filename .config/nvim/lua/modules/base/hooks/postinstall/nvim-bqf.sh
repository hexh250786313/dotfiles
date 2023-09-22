#!/bin/zsh

sd '.*qlist:changedtick.*then\n.*return.*\n.*end' '' ~/.local/share/nvim/site/pack/packer/start/nvim-bqf/lua/bqf/main.lua
sd 'api.nvim_win_get_height\(qwinid\)' '6' ~/.local/share/nvim/site/pack/packer/start/nvim-bqf/lua/bqf/layout.lua
sd 'if incHeight == 0 then\n' 'if incHeight == 0 then api.nvim_win_set_height(qwinid, 6)\n' ~/.local/share/nvim/site/pack/packer/start/nvim-bqf/lua/bqf/layout.lua

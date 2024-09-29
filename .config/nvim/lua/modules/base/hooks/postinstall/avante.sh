#!/usr/bin/env zsh

target_file="$HOME/.local/share/nvim/site/pack/packer/opt/avante.nvim/lua/avante/sidebar.lua"

perl -0777 -i -pe 's/(function Sidebar:close\(\)\n.*?self:delete_autocmds\(\)\n)(?!\s*require\("lualine"\)\.hide\(\{ unhide = true \}\))/\1  require("lualine").hide({ unhide = true })\n/s' $target_file
perl -0777 -i -pe 's/(callback = function\(\)\n.*?self:focus\(\)\n)(?!\s*require\("lualine"\)\.hide\(\))/\1      require("lualine").hide()\n/s' $target_file

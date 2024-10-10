#!/usr/bin/env zsh

sidebar="$HOME/.local/share/nvim/site/pack/packer/opt/avante.nvim/lua/avante/sidebar.lua"
selection="$HOME/.local/share/nvim/site/pack/packer/opt/avante.nvim/lua/avante/selection.lua"


perl -0777 -i -pe 's/(function Sidebar:close\(\)\n.*?self:delete_autocmds\(\)\n)(?!\s*require\("lualine"\)\.hide\(\{ unhide = true \}\))/\1  require("lualine").hide({ unhide = true })\n/s' $sidebar
perl -0777 -i -pe 's/(callback = function\(\)\n.*?self:focus\(\)\n)(?!\s*require\("lualine"\)\.hide\(\))/\1      require("lualine").hide()\n/s' $sidebar
sd 'function Selection:show_shortcuts_hints_popup\(\)\n(  if 1 then return nil end\n)?' 'function Selection:show_shortcuts_hints_popup()\n  if 1 then return nil end\n' $selection

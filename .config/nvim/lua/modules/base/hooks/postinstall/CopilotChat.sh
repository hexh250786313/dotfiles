#!/usr/bin/env zsh

sd 'conceallevel = 2' 'conceallevel = 0' ~/.local/share/nvim/site/pack/packer/opt/CopilotChat.nvim/lua/CopilotChat/ui/chat.lua
sd '1\. For each change.*\n.*' '1. Use chinese to answer all the following questions.' ~/.local/share/nvim/site/pack/packer/opt/CopilotChat.nvim/lua/CopilotChat/config/prompts.lua
sd "function M\.set_source\(source_winnr\)\n  local" "function M.set_source(source_winnr)\n  if true then\n    return false\n  end\n\n  local" ~/.local/share/nvim/site/pack/packer/opt/CopilotChat.nvim/lua/CopilotChat/init.lua

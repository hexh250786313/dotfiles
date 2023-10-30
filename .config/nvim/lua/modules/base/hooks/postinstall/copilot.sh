# sd '.*function!.*s:UpdatePreview.*abort.*\n.*try' 'function! s:UpdatePreview() abort\n  return\n  try' ~/.local/share/nvim/site/pack/packer/opt/copilot.vim/autoload/copilot.vim
sd '=\["\\n"\]' '=["\\n\\n\\n"]' ~/.local/share/nvim/site/pack/packer/opt/copilot.vim/dist/agent.js
sd 'stop=\[`\n`]' 'stop=[`\n\n\n`]' ~/.local/share/nvim/site/pack/packer/opt/copilot.vim/dist/agent.js

if [ -f ~/Documents/nutstore/share/copilot/copilot.sh ]; then
  ~/Documents/nutstore/share/copilot/copilot.sh
fi

if [ -f /mnt/c/Users/25078/Documents/share/copilot/copilot.sh ]; then
  /mnt/c/Users/25078/Documents/share/copilot/copilot.sh
fi

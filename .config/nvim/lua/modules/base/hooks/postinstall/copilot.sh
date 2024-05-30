# 不插入虚拟文本
sd '.*function!.*s:UpdatePreview.*abort.*\n.*try' 'function! s:UpdatePreview() abort\n  return\n  try' ~/.local/share/nvim/site/pack/packer/start/copilot.vim/autoload/copilot.vim
sd '=\["\\n"\]' '=["\\n\\n\\n"]' ~/.local/share/nvim/site/pack/packer/start/copilot.vim/dist/agent.js
sd 'stop=\[`\n`]' 'stop=[`\n\n\n`]' ~/.local/share/nvim/site/pack/packer/start/copilot.vim/dist/agent.js
# 移除多行虚拟文本，让他只展示一行
sd "(?s)if len\(text\) > 1.*?let data\.virt_text \+= \[\[' '], \[annot, s:annot_hlgroup\]\]\n      endif" "" /home/hexh/.local/share/nvim/site/pack/packer/start/copilot.vim/autoload/copilot.vim
# 追加代码，当没有 coc 弹窗时，自动触发 coc
# if !coc#pum#visible()
#  call coc#start()
# endif
# sd " +call nvim_buf_set_extmark\(0, copilot#NvimNs\(\), line\('\.'\)-1, col\('\.'\)-1, data\)" "call nvim_buf_set_extmark(0, copilot#NvimNs(), line('.')-1, col('.')-1, data)\nif !coc#pum#visible()\n  call coc#start()\nendif" /home/hexh/.local/share/nvim/site/pack/packer/start/copilot.vim/autoload/copilot.vim

if [ -f ~/Documents/nutstore/share/copilot/copilot.sh ]; then
  ~/Documents/nutstore/share/copilot/copilot.sh
fi

if [ -f /mnt/c/Users/25078/Documents/share/copilot/copilot.sh ]; then
  /mnt/c/Users/25078/Documents/share/copilot/copilot.sh
fi

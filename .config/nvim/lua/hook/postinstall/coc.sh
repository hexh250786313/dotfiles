#!/bin/zsh

# for release
# perl -0777 -i -pe 's/if\(t==\"\<plug\>\"\|\|this\.plugTs&&o-this\.plugTs<20\)\{this\.plugTs=o;return\}/if\(o-this\.plugTs\<50\)\{return;\}else\{this\.plugTs=o;\}/g' ./build/index.js
# for master
# perl -0777 -i -pe 's/.*if.*"\<plug\>\".*this\.plugTs.*20.*\n.*this\.plugTs.*now(.*\n){2}.*/if\(now-this\.plugTs\<50\)\{return;\}else\{this\.plugTs=now;\}/g' ./build/index.js
sd '.*if.*"<plug>".*this\.plugTs.*20.*\n.*this\.plugTs.*now(.*\n){2}.*' 'if(now-this.plugTs<50){return;}else{this.plugTs=now;}' /home/hexh/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js

# for release
# perl -0777 -i -pe 's/if\(o-this\.plugTs\<\d+\)\{return;\}else\{this\.plugTs=o;\}/if\(o-this\.plugTs\<20\)\{return;\}else\{this\.plugTs=o;\}/g' ./build/index.js
# for master
# perl -0777 -i -pe 's/if\(now-this\.plugTs\<\d+\)\{return;\}else\{this\.plugTs=now;\}/if\(now-this\.plugTs\<20\)\{return;\}else\{this\.plugTs=now;\}/g' ./build/index.js
sd 'if\(now-this\.plugTs<\d+\)\{return;\}else\{this\.plugTs=now;\}' 'if(now-this.plugTs<20){return;}else{this.plugTs=now;}' /home/hexh/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js

# for both
sd 'autocmd.*VimEnter.*call s:VimEnter\(\).*\n.*endif' 'autocmd VimEnter * call s:VimEnter()\n    else\n      call s:VimEnter()\n    endif' /home/hexh/.local/share/nvim/site/pack/packer/opt/coc.nvim/plugin/coc.vim

sd '}\n.*set loading\(loading\)' '  this.mruFlag = true; } set loading(loading)' /home/hexh/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js
sd 'async drawItems\(\) \{' 'async drawItems(context) { if (context.input.length > 0 && this.mruFlag === true) { this.mruFlag = false; await this.loadItems(context); await this.drawItems(context); return; } if (context.input.length === 0 && this.mruFlag === false) { this.mruFlag = true; await this.loadItems(context); await this.drawItems(context); return; }' /home/hexh/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js
sd 'void this.worker.drawItems\(\);' 'void this.worker.drawItems(this.context);' /home/hexh/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js

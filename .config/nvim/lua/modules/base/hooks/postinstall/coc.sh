#!/bin/zsh

src_file="$HOME/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js"
dest_file="$HOME/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js.bak"

if [ ! -e "$dest_file" ]; then
    cp "$src_file" "$dest_file"
fi

# for release
# perl -0777 -i -pe 's/if\(t==\"\<plug\>\"\|\|this\.plugTs&&o-this\.plugTs<20\)\{this\.plugTs=o;return\}/if\(o-this\.plugTs\<50\)\{return;\}else\{this\.plugTs=o;\}/g' ./build/index.js
# for master
# perl -0777 -i -pe 's/.*if.*"\<plug\>\".*this\.plugTs.*20.*\n.*this\.plugTs.*now(.*\n){2}.*/if\(now-this\.plugTs\<50\)\{return;\}else\{this\.plugTs=now;\}/g' ./build/index.js
# 这个的问题在于，导致无法输入中文，所以注释掉先
# sd '.*if.*"<plug>".*this\.plugTs.*20.*\n.*this\.plugTs.*now(.*\n){2}.*' 'if(now-this.plugTs<50){return;}else{this.plugTs=now;}' ~/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js

# for release
# perl -0777 -i -pe 's/if\(o-this\.plugTs\<\d+\)\{return;\}else\{this\.plugTs=o;\}/if\(o-this\.plugTs\<20\)\{return;\}else\{this\.plugTs=o;\}/g' ./build/index.js
# for master
# perl -0777 -i -pe 's/if\(now-this\.plugTs\<\d+\)\{return;\}else\{this\.plugTs=now;\}/if\(now-this\.plugTs\<20\)\{return;\}else\{this\.plugTs=now;\}/g' ./build/index.js
# 这个的问题在于，导致无法输入中文，所以注释掉先
# sd 'if\(now-this\.plugTs<\d+\)\{return;\}else\{this\.plugTs=now;\}' 'if(now-this.plugTs<20){return;}else{this.plugTs=now;}' ~/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js

# for both
sd 'autocmd.*VimEnter.*call s:VimEnter\(\).*\n.*endif' 'autocmd VimEnter * call s:VimEnter()\n    else\n      call s:VimEnter()\n    endif' ~/.local/share/nvim/site/pack/packer/opt/coc.nvim/plugin/coc.vim

sd '}\n.*set loading\(loading\)' '  this.mruFlag = true; } set loading(loading)' ~/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js
sd 'async drawItems\(\) \{' 'async drawItems(context) { var _a2; if (((_a2 = this.list) == null ? void 0 : _a2.name) === "filesMru") { if ((context == null ? void 0 : context.input.length) > 0 && this.mruFlag === true) { this.mruFlag = false; await this.loadItems(context); await this.drawItems(context); return; } if ((context == null ? void 0 : context.input.length) === 0 && this.mruFlag === false) { this.mruFlag = true; await this.loadItems(context); await this.drawItems(context); return; } }' ~/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js
sd 'void this.worker.drawItems\(\);' 'void this.worker.drawItems(this.context);' ~/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js
sd 'range: emptyRange\(range\) \? null' 'range: emptyRange(range) ? { start: range.start, end: { line: range.end.line, character: range.end.character + 1 } }' ~/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js

# cd /mnt/baymax-app-h5-kyc/dist/h5web/kyc/static/js; file="personalComponent.fa7b2f1f.chunk.js"; [ -f $file ] && mv $file $file.bak || cp $file.bak $file; echo ""; ls -a | grep -e $file; echo ""
file="$HOME/.config/coc/extensions/node_modules/coc-tsserver/lib/index.js"; [ -f $file ] && sd ' this\._map\.set\(file2' ' if (file2.startsWith("diffview")) return;this._map.set(file2' $file
rm -rf ~/.config/coc/extensions/node_modules/coc-tsserver/snippets

# 暂时解决 inlayHints 滞后的问题，ref https://github.com/neoclide/coc.nvim/issues/4782
sd 'debounceInterval = getConditionValue\(100, 10\);' 'debounceInterval = getConditionValue(150, 10);' ~/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js

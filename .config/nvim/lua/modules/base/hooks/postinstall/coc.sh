#!/bin/zsh

coc_dir="$HOME/.local/share/nvim/site/pack/packer/opt/coc.nvim"
src_file="$HOME/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js"
bak_file="$HOME/.local/share/nvim/site/pack/packer/opt/coc.nvim/build/index.js.bak"

# 如果没有备份，就备份一下
if [ ! -e "$bak_file" ]; then
    cp "$src_file" "$bak_file"
fi

# 如果有备份，就用备份覆盖源文件
if [ -e "$bak_file" ]; then
    cp "$bak_file" "$src_file"
fi

# for release
# perl -0777 -i -pe 's/if\(t==\"\<plug\>\"\|\|this\.plugTs&&o-this\.plugTs<20\)\{this\.plugTs=o;return\}/if\(o-this\.plugTs\<50\)\{return;\}else\{this\.plugTs=o;\}/g' ./build/index.js
# for master
# perl -0777 -i -pe 's/.*if.*"\<plug\>\".*this\.plugTs.*20.*\n.*this\.plugTs.*now(.*\n){2}.*/if\(now-this\.plugTs\<50\)\{return;\}else\{this\.plugTs=now;\}/g' ./build/index.js
# 这个的问题在于，导致无法输入中文，所以注释掉先
# sd '.*if.*"<plug>".*this\.plugTs.*20.*\n.*this\.plugTs.*now(.*\n){2}.*' 'if(now-this.plugTs<50){return;}else{this.plugTs=now;}' $src_file

# for release
# perl -0777 -i -pe 's/if\(o-this\.plugTs\<\d+\)\{return;\}else\{this\.plugTs=o;\}/if\(o-this\.plugTs\<20\)\{return;\}else\{this\.plugTs=o;\}/g' ./build/index.js
# for master
# perl -0777 -i -pe 's/if\(now-this\.plugTs\<\d+\)\{return;\}else\{this\.plugTs=now;\}/if\(now-this\.plugTs\<20\)\{return;\}else\{this\.plugTs=now;\}/g' ./build/index.js
# 这个的问题在于，导致无法输入中文，所以注释掉先
# sd 'if\(now-this\.plugTs<\d+\)\{return;\}else\{this\.plugTs=now;\}' 'if(now-this.plugTs<20){return;}else{this.plugTs=now;}' $src_file

# for both，已修复，注释掉
# sd 'autocmd.*VimEnter.*call s:VimEnter\(\).*\n.*endif' 'autocmd VimEnter * call s:VimEnter()\n    else\n      call s:VimEnter()\n    endif' ~/.local/share/nvim/site/pack/packer/opt/coc.nvim/plugin/coc.vim

# =========== mru hack 用的，换成使用 fzf 实现
# sd '}\n.*set loading\(loading\)' '  this.mruFlag = true; } set loading(loading)' $src_file
# sd 'async drawItems\(\) \{' 'async drawItems(context) { var _a2; if (((_a2 = this.list) == null ? void 0 : _a2.name) === "filesMru") { if ((context == null ? void 0 : context.input.length) > 0 && this.mruFlag === true) { this.mruFlag = false; await this.loadItems(context); await this.drawItems(context); return; } if ((context == null ? void 0 : context.input.length) === 0 && this.mruFlag === false) { this.mruFlag = true; await this.loadItems(context); await this.drawItems(context); return; } }' $src_file
# sd 'void this.worker.drawItems\(\);' 'void this.worker.drawItems(this.context);' $src_file
# ==================

# 增加 grep preview 指示位置标记，标记第一个字符
sd 'range: emptyRange\(range\) \? null' 'range: emptyRange(range) ? { start: range.start, end: { line: range.end.line, character: range.end.character + 1 } }' $src_file

# cd /mnt/baymax-app-h5-kyc/dist/h5web/kyc/static/js; file="personalComponent.fa7b2f1f.chunk.js"; [ -f $file ] && mv $file $file.bak || cp $file.bak $file; echo ""; ls -a | grep -e $file; echo ""
# 解决diffview 报错
file="$HOME/.config/coc/extensions/node_modules/coc-tsserver/lib/index.js"; [ -f $file ] && sd ' this\._map\.set\(file2' ' if (file2.startsWith("diffview")) return;this._map.set(file2' $file
rm -rf ~/.config/coc/extensions/node_modules/coc-tsserver/snippets

# 暂时解决 inlayHints 滞后的问题，ref https://github.com/neoclide/coc.nvim/issues/4782
# 已修复
# sd 'debounceInterval = getConditionValue\(100, 10\);' 'debounceInterval = getConditionValue(150, 10);' $src_file

# completion item confirm 后，item.command 触发了长任务导致 nvim 堵塞冻结，解决方案是把 await 去掉
sd 'if \(commands_default.has\(item.command.command\)\) \{\n.*await commands_default.execute\(item.command\);\n.*\}' 'if (commands_default.has(item.command.command)) { commands_default.execute(item.command); }' $src_file

# md 格式列表层级对齐错误 已经修复
# sd 'this.o.list\(body, ordered, this.tab\);' 'this.o.list(body, ordered);' $src_file

# 解决 lualine 抽搐
sd '<C-R>=coc#snippet#jump' '<cmd>call coc#snippet#jump' $coc_dir/autoload/coc/snippet.vim
sd '<Esc>:call coc#snippet#jump' '<Esc><cmd>call coc#snippet#jump' $coc_dir/autoload/coc/snippet.vim

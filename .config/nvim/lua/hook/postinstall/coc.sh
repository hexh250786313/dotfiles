#!/bin/zsh

# for release
# perl -0777 -i -pe 's/if\(t==\"\<plug\>\"\|\|this\.plugTs&&o-this\.plugTs<20\)\{this\.plugTs=o;return\}/if\(o-this\.plugTs\<50\)\{return;\}else\{this\.plugTs=o;\}/g' ./build/index.js
# for master
# perl -0777 -i -pe 's/.*if.*"\<plug\>\".*this\.plugTs.*20.*\n.*this\.plugTs.*now(.*\n){2}.*/if\(now-this\.plugTs\<50\)\{return;\}else\{this\.plugTs=now;\}/g' ./build/index.js
sd '.*if.*"<plug>".*this\.plugTs.*20.*\n.*this\.plugTs.*now(.*\n){2}.*' 'if(now-this.plugTs<50){return;}else{this.plugTs=now;}' ./build/index.js

# for release
# perl -0777 -i -pe 's/if\(o-this\.plugTs\<\d+\)\{return;\}else\{this\.plugTs=o;\}/if\(o-this\.plugTs\<20\)\{return;\}else\{this\.plugTs=o;\}/g' ./build/index.js
# for master
# perl -0777 -i -pe 's/if\(now-this\.plugTs\<\d+\)\{return;\}else\{this\.plugTs=now;\}/if\(now-this\.plugTs\<20\)\{return;\}else\{this\.plugTs=now;\}/g' ./build/index.js
sd 'if\(now-this\.plugTs<\d+\)\{return;\}else\{this\.plugTs=now;\}' 'if(now-this.plugTs<20){return;}else{this.plugTs=now;}' ./build/index.js

#!/bin/zsh

perl -0777 -i -pe 's/if\(t==\"\<plug\>\"\|\|this\.plugTs&&o-this\.plugTs<20\)\{this\.plugTs=o;return\}/if\(o-this\.plugTs\<50\)\{return;\}else\{this\.plugTs=o;\}/g' ./build/index.js

perl -0777 -i -pe 's/if\(o-this\.plugTs\<\d+\)\{return;\}else\{this\.plugTs=o;\}/if\(o-this\.plugTs\<20\)\{return;\}else\{this\.plugTs=o;\}/g' ./build/index.js

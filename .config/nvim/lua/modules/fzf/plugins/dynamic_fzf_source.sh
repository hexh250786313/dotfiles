#!/bin/bash

cwd=$1  # 获取传入的当前工作目录
input=$2 # 获取用户输入

# 检查是否有任何输入
if [ -z "$input" ]; then
    # 没有输入时，显示 mru 文件内容
    perl -ne 'print substr($_, length("'"$cwd"'/")) if m{^'"$cwd"'/} && !$seen{$_}++' ~/.config/coc/mru
else
    # 有输入时，搜索当前目录
    fd --type f --hidden
fi

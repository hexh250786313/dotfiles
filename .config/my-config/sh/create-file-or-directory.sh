#!/bin/zsh

if [[ "$1" == */ ]]; then
  # 参数以斜杠结尾，创建文件夹
  directory_name="${1%/}"
  mkdir "$directory_name"
else
  # 参数不以斜杠结尾，创建文件
  touch "$1"
fi

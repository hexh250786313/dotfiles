#!/bin/bash

exclude_file=".git/info/exclude"
search_string=".vim/"

if ! grep -q "$search_string" "$exclude_file"; then
    echo "$search_string" >> "$exclude_file"
fi

cp -rf ~/.config/nvim/_self/templates/.vim ./

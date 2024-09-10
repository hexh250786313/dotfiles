#!/usr/bin/env zsh

# feh --bg-fill ~/桌面/share/图片/wp7312731-blur-abstract-colors-hd-wallpapers.jpg ~/桌面/share/图片/88875544_p3.jpg ~/桌面/share/图片/88875544_p0.jpg

while true; do
  if [[ ! -d ~/图片/WLKQBingWallpapers ]]; then
    feh --bg-fill --no-fehbg --randomize ~/桌面/share/图片/wallpapers/random/* --bg-fill --no-fehbg --randomize ~/桌面/share/图片/wallpapers/random/*
  else
    feh --bg-fill --no-fehbg --randomize ~/图片/WLKQBingWallpapers/* --bg-fill --no-fehbg --randomize ~/图片/WLKQBingWallpapers/*
  fi
sleep 300
done


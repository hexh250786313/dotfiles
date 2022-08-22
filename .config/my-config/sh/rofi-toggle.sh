#!/bin/sh
if pgrep -x rofi; then
  # notify-send "bye" -t 5
  killall rofi
else
  # notify-send "hello" -t 5
  # rofi -combi-modi drun,ssh,run,combi -show combi -run-shell-command '{terminal} -e zsh -ic "{cmd} && read"'
  rofi -normal-window -combi-modi window,drun,ssh,run,combi -show combi -run-shell-command '{terminal} -e zsh -ic "{cmd} && read"' # normal-window 是为了检测有无启动 rofi 以便 toggle, 不是 normal 检测不了
fi

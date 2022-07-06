#!/bin/sh
if pgrep -x rofi; then
  # notify-send "bye" -t 5
  killall rofi
else
  # notify-send "hello" -t 5
  rofi -normal-window -combi-modi window,drun,ssh,run,combi -show combi -run-shell-command '{terminal} -e zsh -ic "{cmd} && read"'
fi

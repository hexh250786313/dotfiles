#!/bin/sh
if pgrep -x rofi; then
  # notify-send "bye" -t 5
  killall rofi
else
  # notify-send "hello" -t 5
  rofi -normal-window -combi-modi window,drun,ssh,run,combi -show combi -run-shell-command '{terminal} -e zsh -ic "{cmd} && read"'
fi

# rofi \
    # -show window  \
    # -kb-cancel "Alt+Escape,Escape" \
    # -kb-accept-entry "!Alt-Tab,Return"\
    # -kb-row-down "Alt+Tab,Alt+Down" \
    # -kb-row-up "Alt+Shift+Tab,Alt+Up"&
# xdotool keyup Tab
# xdotool keydown Tab

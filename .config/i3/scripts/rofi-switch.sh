#!/bin/sh
# rofi \
    # -combi-modi window \
    # -show window  \
    # -kb-cancel "Alt+Escape,Escape" \
    # -kb-accept-entry "!Alt-Tab,Return"\
    # -kb-row-down "Alt+Tab,Alt+Down" \
    # -kb-row-up "Alt+ISO_Left_Tab,Alt+Up"&
# xdotool keyup Tab
# xdotool keydown Tab

xdotool search --sync --syncsleep 10 --limit 1 --class Rofi keyup --delay 0 Tab key --delay 0 Tab keyup --delay 0 Alt keydown --delay 0 Alt&
rofi \
    -combi-modi window \
    -show window \
    -kb-cancel "Alt+Escape,Escape" \
    -kb-accept-entry "!Alt-Tab,Return"\
    -kb-row-down "Alt+Tab,Alt+Down" \
    -kb-row-up "Alt+ISO_Left_Tab,Alt+Up,ISO_Left_Tab"&

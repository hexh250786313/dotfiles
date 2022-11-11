#!/bin/bash

export DISPLAY=':0'
xprop -spy -root _NET_ACTIVE_WINDOW | grep --line-buffered -o '0[xX][a-zA-Z0-9]\{7\}' \
    | while read -r id; do
        class="$(xprop -id $id WM_CLASS)"
        # echo "$class"
        if [[ "$class" =~ "wechat.exe" ]]; then
            sleep .3
            # wmids=$(wmctrl -l -G -p -x | grep "wechat.exe.Wine" | awk -v x=1 '{if(length($10)<=x){print "windowunmap " $1}}' | tr '\n' ' ')
            wmids=$(wmctrl -l -G -p -x | grep "wechat.exe.Wine" | awk -v x=1 '{if(length($10)<=x){print $1}}' | tr '\n' ' ')
            if [ -n $wmids ]; then
                # echo "$wmids" | xargs xdotool windowunmap
                xdotool windowunmap $wmids
            fi
        fi
    done

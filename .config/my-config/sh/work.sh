#!/bin/zsh

SESSIONNAME_0="吔屎です"
tmux has-session -t $SESSIONNAME_0

if [ "$?" != 0 ] 
 then
    tmux new-session -s $SESSIONNAME_0 -n main -d
    tmux send-keys -t $SESSIONNAME_0 "tmux new-window -n code" C-m
    # sleep 2 && tmux send-keys -t $SESSIONNAME_0:3 "all_proxy='' http_proxy='' https_proxy='' musicbox" C-m
    tmux send-keys -t $SESSIONNAME_0 "tmux new-window -n server" C-m
    tmux send-keys -t $SESSIONNAME_0 "tmux new-window -n 10.10.5.28" C-m
    tmux send-keys -t $SESSIONNAME_0 "tmux new-window -n music" C-m
    sleep 2; tmux send-keys -t $SESSIONNAME_0:3 "wd workspace" C-m
    tmux send-keys -t $SESSIONNAME_0:3 "cd MOBILE" C-m
    # tmux send-keys -t $SESSIONNAME_0:3 "gl && yarn && yarn start" C-m
    tmux split-window -h -t $SESSIONNAME_0:3
    tmux send-keys -t $SESSIONNAME_0:3 "wd workspace" C-m
    tmux send-keys -t $SESSIONNAME_0:3 "cd MANAGEMENT" C-m
    # tmux send-keys -t $SESSIONNAME_0:3 "gl && yarn && yarn start" C-m
    # tmux send-keys -t $SESSIONNAME_0:4 "cd ~/.config/openvpn/howard/ && echo 'lllk' | sudo -S openvpn howard.ovpn" C-m
    tmux split-window -h -t $SESSIONNAME_0:4
    # tmux send-keys -t $SESSIONNAME_0:4 "sleep 10 && ssh node@10.10.5.28" C-m
    # tmux send-keys -t $SESSIONNAME_0:4 "frontend-build" C-m
fi

if [ -n "$TMUX" ]
  then
    echo "switching..." && tmux switch -t $SESSIONNAME_0
else
    echo "attaching..." && tmux attach -t $SESSIONNAME_0
fi

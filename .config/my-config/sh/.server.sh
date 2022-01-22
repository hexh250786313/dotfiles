#!/bin/zsh

SESSIONNAME_0="server"
tmux has-session -t $SESSIONNAME_0

if [ "$?" != 0 ] 
 then
    tmux new-session -s $SESSIONNAME_0 -n main -d
    tmux send-keys -t $SESSIONNAME_0 "cd ~/.config/openvpn/howard/ && echo 'lllk' | sudo -S openvpn howard.ovpn" C-m
    tmux split-window -h -t $SESSIONNAME_0
    tmux send-keys -t $SESSIONNAME_0 "sleep 10 && ssh node@10.10.5.28" C-m
    tmux send-keys -t $SESSIONNAME_0 "frontend-build" C-m
fi

if [ -n "$TMUX" ]
  then
    echo "switching..." && sleep 0.5 && tmux switch -t $SESSIONNAME_0
else
    echo "attaching..." && sleep 0.5 && tmux attach -t $SESSIONNAME_0
fi

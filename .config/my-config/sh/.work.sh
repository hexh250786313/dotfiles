#!/bin/zsh

SESSIONNAME_0="work"
tmux has-session -t $SESSIONNAME_0

if [ "$?" != 0 ] 
 then
    tmux new-session -s $SESSIONNAME_0 -n script -d
    tmux send-keys -t $SESSIONNAME_0 "wd workspace" C-m
    tmux send-keys -t $SESSIONNAME_0 "cd MOBILE" C-m
    tmux send-keys -t $SESSIONNAME_0 "gl && yarn && yarn start" C-m
    tmux split-window -h -t work
    tmux send-keys -t $SESSIONNAME_0 "wd workspace" C-m
    tmux send-keys -t $SESSIONNAME_0 "cd MANAGEMENT" C-m
    tmux send-keys -t $SESSIONNAME_0 "gl && yarn && yarn start" C-m
fi

if [ -n "$TMUX" ]
  then
    echo "switching..." && sleep 0.5 && tmux switch -t $SESSIONNAME_0
else
    echo "attaching..." && sleep 0.5 && tmux attach -t $SESSIONNAME_0
fi

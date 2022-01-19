#!/bin/zsh

SESSIONNAME_0="hello"
tmux has-session -t $SESSIONNAME_0

if [ "$?" != 0 ] 
 then
    tmux new-session -s $SESSIONNAME_0 -n script -d
    tmux send-keys -t $SESSIONNAME_0 "nvim" C-m
fi

if [ -n "$TMUX" ]
  then
    echo "switching..." && sleep 0.5 && tmux switch -t $SESSIONNAME_0
else
    echo "attaching..." && sleep 0.5 && tmux attach -t $SESSIONNAME_0
fi

#!/bin/zsh

SESSIONNAME_0="music"
tmux has-session -t $SESSIONNAME_0

if [ "$?" != 0 ] 
 then
    tmux new-session -s $SESSIONNAME_0 -n main -d
    tmux send-keys -t $SESSIONNAME_0 "all_proxy='' http_proxy='' https_proxy='' musicbox" C-m
fi

if [ -n "$TMUX" ]
  then
    echo "switching..." && sleep 0.5 && tmux switch -t $SESSIONNAME_0
else
    echo "attaching..." && sleep 0.5 && tmux attach -t $SESSIONNAME_0
fi

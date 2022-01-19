#!/bin/zsh

SESSIONNAME_0="fluent"
tmux has-session -t $SESSIONNAME_0

if [ "$?" != 0 ] 
 then
    tmux new-session -s $SESSIONNAME_0 -n script -d
    tmux send-keys -t $SESSIONNAME_0 "http-server -p 7777 ~/" C-m
fi

tmux attach -t $SESSIONNAME_0

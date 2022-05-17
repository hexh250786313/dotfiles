#!/bin/zsh

SESSIONNAME_0="hexh"
tmux has-session -t $SESSIONNAME_0

if [ "$?" != 0 ]; then
  tmux new-session -s $SESSIONNAME_0 -n main -d
  tmux send-keys -t $SESSIONNAME_0:1 "tmux set-option repeat-time 0" C-m
  tmux send-keys -t $SESSIONNAME_0:1 "clear" C-m
fi

if [ -n "$TMUX" ]; then
  echo "switching..." && tmux switch -t $SESSIONNAME_0
else
  echo "attaching..." && tmux attach -t $SESSIONNAME_0
fi

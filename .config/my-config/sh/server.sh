#!/bin/zsh

SESSIONNAME_0="server"
tmux has-session -t $SESSIONNAME_0

if [ "$?" != 0 ]; then
  # 创建 session 和 window
  tmux new-session -s $SESSIONNAME_0 -n main -d

  # 发送指令
  # Sample
  # tmux send-keys -t $SESSIONNAME_0:1 "" C-m

  tmux send-keys -t $SESSIONNAME_0:1 "tmux send-keys -t $SESSIONNAME_0:1 'wd workspace mpd-web-ui && yarn start' C-m" C-m
  tmux send-keys -t $SESSIONNAME_0:1 "tmux split-window -h -t $SESSIONNAME_0:1" C-m
  tmux send-keys -t $SESSIONNAME_0:1 "tmux send-keys -t $SESSIONNAME_0:1 'wd workspace mpd-web-api && yarn start' C-m" C-m

  tmux send-keys -t $SESSIONNAME_0:1 "tmux set-option repeat-time 0" C-m
  tmux send-keys -t $SESSIONNAME_0:1 "clear" C-m
fi

if [ -n "$TMUX" ]; then
  echo "switching..." && tmux switch -t $SESSIONNAME_0
else
  echo "attaching..." && tmux attach -t $SESSIONNAME_0
fi

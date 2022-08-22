#!/bin/zsh

SESSIONNAME_0="I_fixed_it!"
tmux has-session -t $SESSIONNAME_0

if [ "$?" != 0 ]; then
  # 创建 session 和 window
  tmux new-session -s $SESSIONNAME_0 -n main -d
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux set-option repeat-time 50" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux new-window -n code" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux new-window -n server" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux new-window -n 10.10.5.28" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux new-window -n music" C-m

  # 发送指令
  # Sample
  # tmux send-keys -t $SESSIONNAME_0:1 "" C-m

  # tmux send-keys -t $SESSIONNAME_0:1 "tmux send-keys -t $SESSIONNAME_0:3 'wd workspace && cd MOBILE' C-m" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux send-keys -t $SESSIONNAME_0:3 'gl && yarn && yarn start' C-m" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux split-window -h -t $SESSIONNAME_0:3" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux send-keys -t $SESSIONNAME_0:3 'wd workspace && cd MANAGEMENT' C-m" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux send-keys -t $SESSIONNAME_0:3 'gl && yarn && yarn start' C-m" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux send-keys -t $SESSIONNAME_0:4 'howard' C-m" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux split-window -h -t $SESSIONNAME_0:3" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux send-keys -t $SESSIONNAME_0:4 'sleep 10 && ssh node@10.10.5.28 && frontend-build' C-m" C-m
  # tmux send-keys -t $SESSIONNAME_0:1 "tmux send-keys -t $SESSIONNAME_0:5 'all_proxy="" http_proxy="" https_proxy="" musicbox' C-m" C-m

  tmux send-keys -t $SESSIONNAME_0:1 "tmux set-option repeat-time 0" C-m
  tmux send-keys -t $SESSIONNAME_0:1 "clear" C-m
fi

if [ -n "$TMUX" ]; then
  echo "switching..." && tmux switch -t $SESSIONNAME_0
else
  echo "attaching..." && tmux attach -t $SESSIONNAME_0
fi

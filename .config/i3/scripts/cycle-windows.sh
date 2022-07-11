id=($(wmctrl -l | awk "/$rx/"'{print $1}'))
# id=( $(xprop -root | grep _NET_CLIENT_LIST_STACKING\(WINDOW | cut -d\  -f5- | awk '{for(i=1;i<=NF;i++){gsub(",", "", $i); printf("%s\n"), $i};}' | tac) )
current=$(xdotool getactivewindow)

if [[ $current ]]; then
  for ((i = 1; i < $((${#id[@]} + 1)); i++)); do
    if [[ $current -eq ${id[$i]} ]]; then
      max=$((${#id[*]}))
      if [[ $i -lt $max ]]; then
        wmctrl -i -a ${id[i + 1]}
      else
        wmctrl -i -a ${id[1]}
      fi
      # sleep 3
    fi
  done
else
  wmctrl -i -a ${id[1]}
fi

id=( $(wmctrl -l | awk "/$rx/"'{print $1}') )
# id=( $(xprop -root | grep _NET_CLIENT_LIST_STACKING\(WINDOW | cut -d\  -f5- | awk '{for(i=1;i<=NF;i++){gsub(",", "", $i); printf("%s\n"), $i};}' | tac) )
current=$(xdotool getactivewindow)

# test=$(( ${#id[@]} ))

# echo $test

for (( i=1; i<$(( ${#id[@]} + 1 )); i++ )) ;do
    # echo $i
    # echo ${id[$i]}
    if  [[ $current -eq ${id[$i]} ]]; then
      # echo ${id[$i]}
      max=$(( ${#id[*]} ))
      if [[ $i -lt $max ]]; then
        echo "1"
        wmctrl -i -a ${id[i+1]}
      else
        echo "2"
        wmctrl -i -a ${id[1]}
      fi
      # sleep 3
    fi
done

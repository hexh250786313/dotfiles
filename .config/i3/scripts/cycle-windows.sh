local allId
local id=()
allId=($(wmctrl -l | awk "/$rx/"'{print $1}'))
# allId=( $(xprop -root | grep _NET_CLIENT_LIST_STACKING\(WINDOW | cut -d\  -f5- | awk '{for(i=1;i<=NF;i++){gsub(",", "", $i); printf("%s\n"), $i};}' | tac) )
current=$(xdotool getactivewindow)

currentClass=($(xprop -id $current | grep "WM_CLASS(STRING)" | awk "/$rx/"'{print $4}'))

for ((i = 1; i < $((${#allId[@]} + 1)); i++)); do
  max=$((${#allId[*]}))
  class=($(xprop -id ${allId[$i]} | grep "WM_CLASS(STRING)" | awk "/$rx/"'{print $4}'))
  if [[ $class != '"Vmware"' || $currentClass == '"Vmware"' ]]; then
    # echo "1"
    id+=(${allId[$i]})
  fi
done

max=$((${#id[*]}))
# echo $max
# echo $id

if [[ $current ]]; then
  for ((i = 1; i < $((${#id[@]} + 1)); i++)); do
    # echo ${id[$i]}
    if [[ $current -eq ${id[$i]} ]]; then
      local next
      if [[ $i -lt $max ]]; then
        next=${id[$(($i + 1))]}
      else
        next=${id[1]}
      fi
      # echo $next
      wmctrl -i -a ${next}
    fi
  done
else
  wmctrl -i -a ${id[1]}
fi

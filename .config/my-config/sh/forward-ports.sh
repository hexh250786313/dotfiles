#!/usr/bin/env zsh

for port in {7766..7776} 22 8877 8878; do
    echo "Processing port $port..."
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh fw-port-set $port"
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh wsl-netsh-unset $port"
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh wsl-netsh-set $port"
done

for port in 4781; do
    echo "Processing port $port..."
    zsh -ic '/home/hexh/.config/my-config/sh/pwsh.sh fw-port-set $port'
    zsh -ic '/home/hexh/.config/my-config/sh/pwsh.sh sudo pwsh -c "netsh interface portproxy add v4tov6 listenport=$port listenaddress=192.168.10.68 connectport=$port connectaddress=::1"'
    zsh -ic '/home/hexh/.config/my-config/sh/pwsh.sh sudo pwsh -c "netsh interface portproxy delete v4tov6 listenport=$port listenaddress=192.168.10.68"'
done

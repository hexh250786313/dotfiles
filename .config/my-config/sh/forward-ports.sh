#!/usr/bin/env zsh

# pwsh wsl-netsh-set-remote 192.168.10.68 3000

for port in {7766..7776} 22 8877 8878; do
    echo "Processing port $port..."
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh fw-port-set $port"
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh wsl-netsh-unset-remote 192.168.10.160 $port"
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh wsl-netsh-set-remote 192.168.10.160 $port"
done

for port in {4781}; do
    echo "Processing port $port..."
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh fw-port-set $port"
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh sudo pwsh -c \"netsh interface portproxy delete v4tov6 listenport=$port listenaddress=192.168.10.160\""
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh sudo pwsh -c \"netsh interface portproxy add v4tov6 listenport=$port listenaddress=192.168.10.160 connectport=$port connectaddress=::1\""
done

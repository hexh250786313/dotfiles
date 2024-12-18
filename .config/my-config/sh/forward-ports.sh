#!/usr/bin/env zsh

for port in {7766..7776} 22 8877 8878; do
    echo "Processing port $port..."
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh fw-port-set $port"
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh wsl-netsh-unset $port"
    zsh -ic "/home/hexh/.config/my-config/sh/pwsh.sh wsl-netsh-set $port"
done

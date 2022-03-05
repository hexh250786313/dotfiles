#!/bin/sh

pwsh="pwsh.exe"

set_port(){
  pwsh wsl-netsh-set $2
  pwsh fw-port-set $2
}

unset_port(){
  pwsh wsl-netsh-unset $2
  pwsh fw-port-unset $2
}

if [ "$1" = "set" ]
then
set_port $*

elif [ "$1" = "unset" ]
then
unset_port $*

else
echo "Unsupported arguments."
fi

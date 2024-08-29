#!/bin/bash

#-----------------------
# keep wsl distro alive
#-----------------------
if ! pgrep -u "$(whoami)" -x "dbus-daemon" >/dev/null; then
  dbus-launch true
fi

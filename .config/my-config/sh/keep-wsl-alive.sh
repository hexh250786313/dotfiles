#!/usr/bin/env bash

#-----------------------
# keep wsl distro alive，既需要在 windows 定时计划中启动（ssh 的情况），也需要在 zshrc 中添加（wsl --shutdown 的情况）
# 原本打算在 service 中加，但是不知道为什么一直无法启动，先不研究
#-----------------------
if ! pgrep -u "$(whoami)" -x "dbus-daemon" >/dev/null; then
  dbus-launch true
fi

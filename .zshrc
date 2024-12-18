# requirement
# export MY_HOST=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
# export MY_HOST=$(ip route show | grep -i default | awk '{ print $3}')
export MY_HOST=127.0.0.1
unset HOST
export CONFIG_DIR="/home/$ME/.config"
export ME="hexh"
export REAL_ME="hexh"
export ZSH_CUSTOM="/home/$ME/.oh-my-zsh/custom"
export CONFIG_DIR="/home/$ME/.config"

if [[ -n "$SSH_CONNECTION" ]]; then
  SSH_CLIENT_IP=192.168.10.65
  export DISPLAY="${SSH_CLIENT_IP}:0.0"
else
  export DISPLAY="$(ip route show | grep -i default | awk '{ print $3}'):0.0"
fi

export ANDROID_HOME=$HOME/build/android-sdk

# path
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/home/$ME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$HOME/build/flutter/bin"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$HOME/build/android-sdk/platform-tools"

# proxy
# export all_proxy="socks5://$MY_HOST:4781"
# export http_proxy="http://$MY_HOST:4781"
# export https_proxy="http://$MY_HOST:4781"
alias proxy_unset="unset all_proxy && unset http_proxy && unset https_proxy"
alias proxy_set="export all_proxy="socks://$MY_HOST:4781" && export http_proxy="http://$MY_HOST:4781" && export https_proxy="http://$MY_HOST:4781""

# p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
if [[ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi
if [[ ! -f ~/.p10k.zsh ]]; then
  ln -s ~/workspace/dotfiles/.p10k.zsh ~/.p10k.zsh
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# env
export LANG=en_US.UTF-8
export EDITOR=nvim
export REACT_EDITOR=nvim
export OPENCV_LOG_LEVEL=ERROR

# zsh config
# ZSH_DISABLE_COMPFIX="true" # 如果报了 completion 的错就打开，否则注释掉
setopt globdots
setopt rm_starsilent

# alias
# alias nvim="/home/hexh/Download/nvim.appimage"
alias sudo="sudo "
alias cache-free="sh -c 'echo 1 > /proc/sys/vm/drop_caches'"
alias editor=nvim
alias lazygit="lazygit -ucf ~/workspace/dotfiles/.config/lazygit/config.yml"
alias zhiyun-chrome='proxy_unset && export http_proxy="http://10.10.1.30:6699" && export https_proxy="http://10.10.1.30:6699" && google-chrome-stable --disable-site-isolation-trials --disable-web-security --user-data-dir="/home/hexh/Desktop/chrome-data"'
# alias fd="fdfind"
# alias bat="batcat"
# alias python="python3"
alias gitr='cd "$(git rev-parse --show-toplevel)"'

# plugin
if [[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi
if [[ ! -d $ZSH_CUSTOM/plugins/F-Sy-H ]]; then
  git clone https://github.com/z-shell/F-Sy-H.git $ZSH_CUSTOM/plugins/F-Sy-H
fi
if [[ ! -f ~/.warprc ]]; then
  ln -s ~/workspace/dotfiles/.warprc ~/.warprc
fi
if [[ ! -f ~/.fzf.zsh ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi
if [[ ! -f $CONFIG_DIR/ranger/rc.conf ]]; then
  ln -s ~/workspace/dotfiles/.config/ranger/rc.conf $CONFIG_DIR/ranger/rc.conf
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude '.git/**/*' --exclude 'node_modules/**/*'"
export FZF_DEFAULT_OPTS="--bind up:preview-up,down:preview-down"
if [[ ! -d $ZSH_CUSTOM/plugins/fzf-tab ]]; then
  git clone https://github.com/Aloxaf/fzf-tab.git $ZSH_CUSTOM/plugins/fzf-tab
fi
alias nvimf='nvim $(fzf --reverse --preview-window "right:50%" --preview "COLORTERM=truecolor bat --style=numbers --color=always --line-range :100 {}")'
alias gb="(git branch --sort=-committerdate | head -n 30 && git branch --sort=-committerdate -r | head -n 30) | grep -v HEAD | fzf --reverse --preview-window \"right:70%\" --preview \"git log --max-count=333 --color=always --format='%C(auto)%h%d %C(green)%cr%C(reset) %C(yellow)%cn%C(reset) %s %C(black)%C(bold)%cr' {1}\" | perl -0777 -pe \"s/.*origin\///i\" | xargs git checkout"
plugins=(
  wd
  zsh-autosuggestions
  F-Sy-H
  fzf-tab
  docker         # docker 补全
  docker-compose # docker-compose 补全
)

# script
if [[ ! -d $CONFIG_DIR/my-config ]]; then
  ln -s ~/workspace/dotfiles/.config/my-config $CONFIG_DIR/my-config
fi
alias work="source ~/.config/my-config/sh/work.sh"
alias hexh="source ~/.config/my-config/sh/hexh.sh"
alias initvim="source ~/.config/my-config/sh/init-vim.sh"
alias pwsh="~/.config/my-config/sh/pwsh.sh"

# init omz
export ZSH="/home/$ME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
bindkey -r "^j" # disable c-j to return
bindkey -r "^k" # disable c-k

# fnm
# if [[ ! -f /home/$ME/.local/share/fnm ]]; then
#   curl -fsSL https://fnm.vercel.app/install | zsh
# fi
export PATH="/home/$ME/.local/share/fnm:$PATH"
# eval "`fnm env`"
export DEFAULT_NODE_VERSION="v20.16.0"
export LOWER_NODE_VERSION="v14.15.0"
eval "$(fnm env --use-on-cd)"
export NODE_OPTIONS="--max-old-space-size=8192"
export MY_NODE_PATH="/home/$ME/.local/share/fnm/node-versions/$DEFAULT_NODE_VERSION/installation"
export NODE_PATH=$(npm root --global)
# alias yarn="$MY_NODE_PATH/bin/yarn"
alias http-server="$MY_NODE_PATH/bin/http-server"

# 切换 node 版本
lower_node_paths=(
  "crm-h5"
  "crm-client"
  "crm-components"
  "crm-ib"
  "public-h5"
  "h5-design"
  "h5-utils"
  "h5-api"
  "h5-kyc"
)
use_lower_node() {
  current_path=$(pwd)
  node_version=$(node --version)
  match_found=false

  # 检查当前目录是否存在 .nvmrc 文件
  if [[ -f ".nvmrc" ]]; then
    return  # 忽略已经有 .nvmrc 的目录，让其遵循 .nvmrc
  fi

  for path_pattern in "${lower_node_paths[@]}"; do
    if [[ $current_path == *$path_pattern* ]]; then
      match_found=true
      break
    fi
  done

  if $match_found; then
    if [[ " ${LOWER_NODE_VERSION} " != *" $node_version " ]]; then
      proxy_unset
      fnm use $LOWER_NODE_VERSION
    fi
  else
    if [[ " ${DEFAULT_NODE_VERSION} " != *" $node_version " ]]; then
      fnm use default
    fi
  fi
}
use_lower_node
# -------------------

# lsd
# lsd, also need to be put after the omz.sh
alias l="lsd -lAtFh --blocks=size,date,name"
alias ll="lsd -lAtFh --blocks=size,date,name"
alias la="lsd -AF --group-directories-first"
alias ls="lsd -AF --group-directories-first"
# alias nviml="la -1r | tail -n 1 | xargs nvim"
alias latestf="lsd -1AtrF | grep -v '/$' | tail -n 1 | xargs echo -n"
alias nviml="fd --type f --hidden --exclude '.git/**/*' --exclude 'node_modules/**/*' --exec-batch lsd -AtF -1r | tail -n 1 | xargs nvim"

# mcfly
export MCFLY_DISABLE_MENU=TRUE
export MCFLY_FUZZY=2
eval "$(mcfly init zsh | sed "s,\^R,^Q,")"

# zoxide
eval "$(zoxide init zsh)"

# 自定义 chpwd hook
_ls_on_cwd_change() {
  use_lower_node
}
# load add-zsh-hook if it's not available yet
(( $+functions[add-zsh-hook] )) || autoload -Uz add-zsh-hook
add-zsh-hook chpwd _ls_on_cwd_change
# Additional info
# list existing hook functions
# add-zsh-hook -L
# or
# add-zsh-hook -L chpwd
# -------------------

edit-command-line() {
  # local tmpfile=$(mktemp) # 使用随机文件名
  local tmpfile="/tmp/zsh-edit-buffer" # 使用固定文件名
  # 在临时文件开头添加 #!/usr/bin/env zsh
  echo "#!/usr/bin/env zsh" > $tmpfile
  print -r -- $BUFFER >> $tmpfile
  nvim -c "set ft=sh" $tmpfile
  # 从临时文件中读取内容，并移除第一行（#!/usr/bin/env zsh）
  BUFFER=$(sed '1d' $tmpfile)
  CURSOR=$#BUFFER
  rm -f $tmpfile
}

bindkey '^X' edit-command-line

### Misc
# 记得更换完主题后执行，否则不生效：bat cache --build
# export BAT_THEME="arctic"
# export BAT_THEME="CatppuccinMocha"
export BAT_THEME="CatppuccinLatte" # 适合白色背景

source ~/.config/my-config/sh/keep-wsl-alive.sh

# 退出 ranger 保留在原地
function ranger {
  local tempfile="$(mktemp -t tmp.XXXXXX)"
  command ranger --choosedir="$tempfile" "$@"
  if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(pwd)" ]]; then
    cd -- "$(cat "$tempfile")" || return
  fi
  command rm -f -- "$tempfile" 2>/dev/null
}

# alias nvimr="nvim --headless --listen localhost:7766 & sleep 1 && ssh -p 2222 'hexh-ser\\25078'@192.168.10.65 'C:\Users\25078\Desk\PsExec.exe -accepteula -i 1 -d \"explorer.exe\" \"C:\Users\25078\Desk\7766.bat\"'"

function nvimr() {
    # 在指定范围内查找可用端口
    local port
    for p in {7766..7776}; do
        if ! nc -z localhost $p 2>/dev/null; then
            port=$p
            break
        fi
    done

    if [ -z "$port" ]; then
        echo "No available ports in range 7766-7776"
        return 1
    fi

    # 创建临时 bat 文件
    local bat_content="@echo off\r\n:: 切换到用户主目录\r\ncd /d %USERPROFILE%\r\n\r\n:: 启动 neovide\r\nstart \"\" \"C:\\\\Users\\\\25078\\\\scoop\\\\shims\\\\neovide.exe\" --server 192.168.10.68:$port"
    local temp_bat="/tmp/$port.bat"
    echo -e "$bat_content" > "$temp_bat"

    # 传送文件到远程 Windows
    scp -P 2222 "$temp_bat" 'hexh-ser\25078'@192.168.10.65:"C:/Users/25078/Desk/$port.bat"
    rm "$temp_bat"

    # 启动 nvim 服务
    echo "Starting Neovim server on port $port..."
    nvim --headless --listen localhost:$port &

    # 等待端口可用并执行远程命令
    while ! nc -z localhost $port; do
        sleep 0.1
    done

    ssh -p 2222 'hexh-ser\25078'@192.168.10.65 "C:\\Users\\25078\\Desk\\PsExec.exe -accepteula -i 1 -d \"explorer.exe\" \"C:\\Users\\25078\\Desk\\$port.bat\""
    sleep 2
    ssh -p 2222 'hexh-ser\25078'@192.168.10.65 "del /f /q C:\\Users\\25078\\Desk\\$port.bat"

    # 等待 nvim 服务结束
    wait
}

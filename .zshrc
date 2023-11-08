# test zsh speed start
# zmodload zsh/zprof
# -------------------

export MY_HOST="127.0.0.1"

# add cargo binary
export PATH="$HOME/.cargo/bin:$PATH"

# add python virtualenv
export PATH="$HOME/venv/bin:$PATH"

# used by following config
export ZSH_CUSTOM="/home/hexh/.oh-my-zsh/custom"
export CONFIG_DIR="/home/hexh/.config"

lazy_load() {
    # Act as a stub to another shell function/command. When first run, it will load the actual function/command then execute it.
    # E.g. This made my zsh load 0.8 seconds faster by loading `nvm` when "nvm", "npm" or "node" is used for the first time
    # $1: space separated list of alias to release after the first load
    # $2: file to source
    # $3: name of the command to run after it's loaded
    # $4+: argv to be passed to $3
    echo "Lazy loading $1 ..."

    # $1.split(' ') using the s flag. In bash, this can be simply ($1) #http://unix.stackexchange.com/questions/28854/list-elements-with-spaces-in-zsh
    # Single line won't work: local names=("${(@s: :)${1}}"). Due to http://stackoverflow.com/questions/14917501/local-arrays-in-zsh   (zsh 5.0.8 (x86_64-apple-darwin15.0))
    local -a names
    if [[ -n "$ZSH_VERSION" ]]; then
        names=("${(@s: :)${1}}")
    else
        names=($1)
    fi
    unalias "${names[@]}"
    . $2
    shift 2
    $*
}

group_lazy_load() {
    local script
    script=$1
    shift 1
    for cmd in "$@"; do
        alias $cmd="lazy_load \"$*\" $script $cmd"
    done
}

# -------------------

# proxy
export SPRING_BOARD=192.168.1.4
# export all_proxy="socks://127.0.0.1:4780"
# export http_proxy="http://127.0.0.1:4780"
# export https_proxy="http://127.0.0.1:4780"
alias fluent-proxy="source ~/.config/my-config/sh/fluent_proxy.sh"
alias proxy_unset="unset all_proxy && unset http_proxy && unset https_proxy"
alias proxy_set="export all_proxy="socks://127.0.0.1:4780" && export http_proxy="http://127.0.0.1:4780" && export https_proxy="http://127.0.0.1:4780""
alias proxy_songmao='export all_proxy="http://$SPRING_BOARD:6698" && export http_proxy="http://$SPRING_BOARD:6699" && export https_proxy="http://$SPRING_BOARD:6699"'
# -------------------

# p10k
# put it at the first of rc file to faster zsh
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
# -------------------

# some env variable
export LANG=en_US.UTF-8
export EDITOR="zsh -i -c nvim"
export REACT_EDITOR="zsh -i -c nvim"
export OPENCV_LOG_LEVEL=ERROR
# -------------------

# zsh config
# ZSH_DISABLE_COMPFIX="true" # 如果报了 completion 的错就打开，否则注释掉
setopt globdots
setopt rm_starsilent
# -------------------

# plugins
# 通知
# if [[ ! -d $ZSH_CUSTOM/plugins/auto-notify ]]; then
#   git clone https://github.com/MichaelAquilina/zsh-auto-notify.git $ZSH_CUSTOM/plugins/auto-notify
# fi
if [[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi
if [[ ! -d $ZSH_CUSTOM/plugins/F-Sy-H ]]; then
  git clone https://github.com/z-shell/F-Sy-H.git $ZSH_CUSTOM/plugins/F-Sy-H
fi
if [[ ! -d ~/.git-webui ]]; then
  wget -O - https://raw.githubusercontent.com/alberthier/git-webui/master/install/installer.sh | zsh
fi
if [[ ! -f ~/.warprc ]]; then
  ln -s ~/workspace/dotfiles/.warprc ~/.warprc
fi
if [[ ! -f ~/.fzf.zsh ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude '.git/**/*' --exclude 'node_modules/**/*'"
export FZF_DEFAULT_OPTS="--bind up:preview-up,down:preview-down"
if [[ ! -d $ZSH_CUSTOM/plugins/fzf-tab ]]; then
  git clone https://github.com/Aloxaf/fzf-tab.git $ZSH_CUSTOM/plugins/fzf-tab
fi
alias nvimf='nvim $(fzf --reverse --preview-window "right:50%" --preview "COLORTERM=truecolor bat --style=numbers --color=always --line-range :100 {}")' # must single quote to avoid fzf executed at zsh initing
# alias gb='git branch --sort=-committerdate | fzf --reverse --preview-window "right:90%" --preview "git diff {1} | delta" | xargs git checkout'
# & 异步, && 同步
# 找出前 10 个远程和本地分支, 用日期排序 -> 过滤掉带有 HEAD 的 -> fzf -> 选择分支后剪切如 ref/origin/beta 变为 beta -> checkout
alias gb="(git branch --sort=-committerdate | head -n 10 && git branch --sort=-committerdate -r | head -n 10) | grep -v HEAD | fzf --reverse --preview-window \"right:70%\" --preview \"git log --max-count=333 --color=always --format='%C(auto)%h%d %C(green)%cr%C(reset) %C(yellow)%cn%C(reset) %s %C(black)%C(bold)%cr' {1}\" | perl -0777 -pe \"s/.*origin\///i\" | xargs git checkout"
plugins=(
  # auto-notify
  # git
  wd
  zsh-autosuggestions
  F-Sy-H
  fzf-tab
  docker         # docker 补全
  docker-compose # docker-compose 补全
)
# -------------------

# alias
alias nvim=~/build/neovim/nvim.appimage
alias sudo="sudo "
alias cache-free="sh -c 'echo 1 > /proc/sys/vm/drop_caches'"
alias editor=nvim
alias lazygit="lazygit -ucf ~/workspace/dotfiles/.config/lazygit/config.yml"
alias vm-set="sudo sh -c 'echo 0 > /proc/sys/vm/compaction_proactiveness' && cat /proc/sys/vm/compaction_proactiveness"
alias makepkg-without-check="makepkg -si --nocheck"
# alias zhiyun-chrome='proxy_unset && export http_proxy="http://10.10.1.30:6699" && export https_proxy="http://10.10.1.30:6699" && google-chrome-stable --disable-site-isolation-trials --disable-web-security --user-data-dir="/home/hexh/Desktop/chrome-data"'
alias zhiyun-chrome='google-chrome-stable --disable-site-isolation-trials --disable-web-security --allow-running-insecure-content --user-data-dir="/home/hexh/Desktop/chrome-data"'
alias maudio='mpv --no-video'
alias ranger="source ranger"
alias gitr='cd "$(git rev-parse --show-toplevel)"'
# -------------------

# my script
if [[ ! -d $CONFIG_DIR/my-config ]]; then
  ln -s ~/workspace/dotfiles/.config/my-config ~/.config/my-config
fi
alias work="source ~/.config/my-config/sh/work.sh"
alias hexh="source ~/.config/my-config/sh/hexh.sh"
alias server="source ~/.config/my-config/sh/server.sh"
alias git-dude="source ~/.config/my-config/sh/git-dude/git-dude.sh"
alias lock="source ~/.config/my-config/sh/lock.sh"
alias edward="proxy_unset && cd ~/Documents/nutstore/share/openvpn/songmao/ && echo 'lllk' | sudo -S openvpn edward.ovpn"
alias initvim="source ~/.config/my-config/sh/init-vim.sh"
alias createfile="source ~/.config/my-config/sh/create-file-or-directory.sh"
# -------------------

# fnm
# a better nvm
export DEFAULT_NODE_VERSION="v18.17.1"
export LOWER_NODE_VERSION="v14.21.3"
eval "$(fnm env --use-on-cd)"
export NODE_OPTIONS="--max-old-space-size=8192"
export MY_NODE_PATH="/home/hexh/.local/share/fnm/node-versions/$DEFAULT_NODE_VERSION/installation"
export NODE_PATH=$(npm root --global)
# alias yarn="$MY_NODE_PATH/bin/yarn"
alias http-server="$MY_NODE_PATH/bin/http-server"
# -------------------

# nvm
# export NVM_DIR="$HOME/.nvm"
# export MY_NODE_PATH="/home/hexh/.nvm/versions/node/$DEFAULT_NODE_VERSION"
# export NODE_PATH="/home/hexh/.nvm/versions/node/$DEFAULT_NODE_VERSION/lib/node_modules"
# alias yarn="$MY_NODE_PATH/bin/yarn"
# alias http-server="$MY_NODE_PATH/bin/http-server"
# group_lazy_load $NVM_DIR/nvm.sh nvm node npm # 只在执行剩余参数时 (nvm node npm) 才 load 第一个参数
# -------------------

# python
# export PYTHONPATH="/usr/lib/python3.10"
# -------------------

# omz init
# put it at the last of rc file to init omz
export ZSH="/home/hexh/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
# bindkey -r "^r"
bindkey -r "^j" # disable c-j to return
bindkey -r "^k" # disable c-k
unset -f group_lazy_load
# -------------------

# ruby
# put it at the last of rc file (after omz.sh init) to cover the default zsh config
# eval "$(rbenv init - zsh)"
# alias l="colorls --report=short -A -o -g -G --no-hardlinks -t -r"
# alias la="colorls -A --sd"
# alias ll="colorls --report=short -A -o -g -G --no-hardlinks -t -r"
# alias ls="colorls -A --sd"
# -------------------

# lsd, also need to be put after the omz.sh
alias l="lsd -lAtFh --blocks=size,date,name"
alias ll="lsd -lAtFh --blocks=size,date,name"
alias la="lsd -AF --group-directories-first"
alias ls="lsd -AF --group-directories-first"
# alias nviml="la -1r | tail -n 1 | xargs nvim"
alias latestf="lsd -1AtrF | grep -v '/$' | tail -n 1 | xargs echo -n"
alias nviml="fd --type f --hidden --exclude '.git/**/*' --exclude 'node_modules/**/*' --exec-batch lsd -AtF -1r | tail -n 1 | xargs nvim"
# -------------------

# mcfly
# a better ctrl-r
export MCFLY_DISABLE_MENU=TRUE
export MCFLY_FUZZY=2
# export MCFLY_KEY_SCHEME=vim
eval "$(mcfly init zsh | sed "s,\^R,^Q,")"
# eval "$(mcfly init zsh | sed "s,\^N,^J,")"
# eval "$(mcfly init zsh | sed "s,\^J,^N,")"
# eval "$(mcfly init zsh)"
# -------------------

# zoxide
eval "$(zoxide init zsh)"
# -------------------

# 切换 node 版本
lower_node_paths=(
  "crm-h5"
  "crm-client"
  "crm-components"
  "crm-ib"
  "public-h5"
  "h5-design"
  "h5-utils"
  "crm-login-web"
  "h5-api"
  "h5-common"
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

# test zsh speed end
# zprof
# -------------------
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

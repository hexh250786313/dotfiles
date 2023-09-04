# requirement
export MY_HOST=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
unset HOST
export CONFIG_DIR="/home/$ME/.config"
export ME="hexh"
export REAL_ME="hexh"
export ZSH_CUSTOM="/home/$ME/.oh-my-zsh/custom"
export CONFIG_DIR="/home/$ME/.config"
# export DISPLAY=$MY_HOST:0.0

# path
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/home/$ME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$HOME/go/bin:$PATH:"
export GOPATH="$HOME/go"

# proxy
# export all_proxy="socks5://$MY_HOST:4780"
# export http_proxy="http://$MY_HOST:4780"
# export https_proxy="http://$MY_HOST:4780"
alias proxy_unset="unset all_proxy && unset http_proxy && unset https_proxy"
alias proxy_set="export all_proxy="socks://$MY_HOST:4780" && export http_proxy="http://$MY_HOST:4780" && export https_proxy="http://$MY_HOST:4780""

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
alias sudo="sudo "
alias cache-free="sh -c 'echo 1 > /proc/sys/vm/drop_caches'"
alias editor=nvim
alias lazygit="lazygit -ucf ~/workspace/dotfiles/.config/lazygit/config.yml"
alias zhiyun-chrome='proxy_unset && export http_proxy="http://10.10.1.30:6699" && export https_proxy="http://10.10.1.30:6699" && google-chrome-stable --disable-site-isolation-trials --disable-web-security --user-data-dir="/home/hexh/Desktop/chrome-data"'
alias ranger="source ranger"
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
alias gb="(git branch --sort=-committerdate | head -n 10 && git branch --sort=-committerdate -r | head -n 10) | grep -v HEAD | fzf --reverse --preview-window \"right:70%\" --preview \"git log --max-count=333 --color=always --format='%C(auto)%h%d %C(green)%cr%C(reset) %C(yellow)%cn%C(reset) %s %C(black)%C(bold)%cr' {1}\" | perl -0777 -pe \"s/.*origin\///i\" | xargs git checkout"
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
if [[ ! -f /home/$ME/.local/share/fnm/fnm ]]; then
  curl -fsSL https://fnm.vercel.app/install | zsh
fi
export PATH="/home/$ME/.local/share/fnm:$PATH"
# eval "`fnm env`"
export DEFAULT_NODE_VERSION="v18.17.1"
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

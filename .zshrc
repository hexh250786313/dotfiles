# used by following config
export ZSH_CUSTOM="/home/hexh/.oh-my-zsh/custom"
export CONFIG_DIR="/home/hexh/.config"
# -------------------

# proxy
export all_proxy="socks://127.0.0.1:4780"
export http_proxy="http://127.0.0.1:4780"
export https_proxy="http://127.0.0.1:4780"
alias fluent-proxy="source ~/.config/my-config/sh/fluent_proxy.sh"
alias proxy_unset="unset all_proxy && unset http_proxy && unset https_proxy"
alias proxy_set="export all_proxy="socks://127.0.0.1:4780" && export http_proxy="http://127.0.0.1:4780" && export https_proxy="http://127.0.0.1:4780""
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
# -------------------

# some env variable
export LANG=en_US.UTF-8
export EDITOR=nvim
export REACT_EDITOR=nvim
export OPENCV_LOG_LEVEL=ERROR
# -------------------

# zsh config
# ZSH_DISABLE_COMPFIX="true" # 如果报了 completion 的错就打开，否则注释掉
setopt globdots
setopt rm_starsilent
# -------------------

# plugins
if [[ ! -d $ZSH_CUSTOM/plugins/auto-notify ]]; then
  git clone https://github.com/MichaelAquilina/zsh-auto-notify.git $ZSH_CUSTOM/plugins/auto-notify
fi
if [[ ! -d $ZSH_CUSTOM/plugins/alias-tips ]]; then
  git clone https://github.com/djui/alias-tips.git $ZSH_CUSTOM/plugins/alias-tips
fi
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
if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi
source ~/.zsh-autopair/autopair.zsh
autopair-init
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude '.git/**/*' --exclude 'node_modules/**/*'"
alias nvimf='nvim $(fzf --reverse)' # must single quote to avoid fzf executed at zsh initing
plugins=(
  auto-notify
  alias-tips
  git
  wd
  zsh-autosuggestions
  F-Sy-H
  docker         # docker 补全
  docker-compose # docker-compose 补全
)
# -------------------

# alias
alias sudo="sudo "
alias cache-free="sh -c 'echo 1 > /proc/sys/vm/drop_caches'"
alias editor=nvim
alias lazygit="lazygit -ucf ~/workspace/dotfiles/.config/lazygit/config.yml"
alias vm-set="sudo sh -c 'echo 0 > /proc/sys/vm/compaction_proactiveness' && cat /proc/sys/vm/compaction_proactiveness"
alias makepkg-without-check="makepkg -si --nocheck"
alias zhiyun-chrome='proxy_unset && export http_proxy="http://10.10.1.66:6699" && export https_proxy="http://10.10.1.66:6699" && google-chrome-stable --disable-site-isolation-trials --disable-web-security --user-data-dir="/home/hexh/Desktop/chrome-data"'
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
alias howard="cd ~/.config/openvpn/howard/ && echo 'lllk' | sudo -S openvpn howard.ovpn"
# -------------------

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
export MY_NODE_PATH="/home/hexh/.nvm/versions/node/v16.17.0"
export NODE_PATH="$(npm root --global)"
export NODE_OPTIONS="--max-old-space-size=8192"
alias yarn="$MY_NODE_PATH/bin/yarn"
alias http-server="$MY_NODE_PATH/bin/http-server"
# -------------------

# omz init
# put it at the last of rc file to init omz
export ZSH="/home/hexh/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
# -------------------

# ruby
# put it at the last of rc file (after omz.sh init) to cover the default zsh config
eval "$(rbenv init - zsh)"
alias l="colorls --report=short -A -o -g -G --no-hardlinks -t -r"
alias la="colorls -A --sd"
alias ll="colorls --report=short -A -o -g -G --no-hardlinks -t -r"
alias ls="colorls -A --sd"
# -------------------

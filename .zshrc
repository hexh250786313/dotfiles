export LANG=en_US.UTF-8
# ZSH_DISABLE_COMPFIX="true" # 如果报了 completion 的错就打开，否则注释掉 export ZSH="/home/hexh/.oh-my-zsh"
export EDITOR=nvim
export REACT_EDITOR=nvim
export ZSH_CUSTOM="/home/hexh/.oh-my-zsh/custom"

setopt globdots

if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi
source ~/.zsh-autopair/autopair.zsh
autopair-init

if [[ ! -d $ZSH_CUSTOM/plugins/auto-notify ]]; then
  git clone https://github.com/MichaelAquilina/zsh-auto-notify.git $ZSH_CUSTOM/plugins/auto-notify
fi

if [[ ! -d $ZSH_CUSTOM/plugins/alias-tips ]]; then
  echo "hello"
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

alias sudo="sudo "

alias work="source ~/.config/my-config/sh/work.sh"
alias hexh="source ~/.config/my-config/sh/hexh.sh"
alias fluent-proxy="source ~/.config/my-config/sh/fluent_proxy.sh"
alias server="source ~/.config/my-config/sh/server.sh"
alias git-dude="source ~/.config/my-config/sh/git-dude/git-dude.sh"

alias lock="source ~/.config/my-config/sh/lock.sh"
alias music="all_proxy='' http_proxy='' https_proxy='' musicbox"
alias howard="cd ~/.config/openvpn/howard/ && echo 'lllk' | sudo -S openvpn howard.ovpn"

alias cache-free="sh -c 'echo 1 > /proc/sys/vm/drop_caches'"

if [[ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
if [[ ! -f ~/.p10k.zsh ]]; then
  ln -s ~/workspace/dotfiles/.p10k.zsh ~/.p10k.zsh
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NODE_OPTIONS="--max-old-space-size=8192"

export all_proxy="socks://127.0.0.1:4780"
export http_proxy="http://127.0.0.1:4780"
export https_proxy="http://127.0.0.1:4780"
alias proxy_unset="unset all_proxy && unset http_proxy && unset https_proxy"
alias proxy_set="export all_proxy="socks://127.0.0.1:4780" && export http_proxy="http://127.0.0.1:4780" && export https_proxy="http://127.0.0.1:4780""

eval "$(rbenv init - zsh)"

alias lc="colorls -lA --sd"
alias la="colorls -a --sd"
alias ll="colorls -l --sd"
alias ls="colorls --sd"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export OPENCV_LOG_LEVEL=ERROR
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv > /dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source $ZSH/oh-my-zsh.sh

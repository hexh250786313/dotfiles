export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="/home/hexh/.oh-my-zsh/custom"
ZSH_THEME="robbyrussell"
export EDITOR=subl

setopt globdots

if [[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

if [[ ! -d $ZSH_CUSTOM/plugins/F-Sy-H ]]; then
  git clone https://github.com/z-shell/F-Sy-H.git $ZSH_CUSTOM/plugins/F-Sy-H
fi

plugins=(
  git
  wd
  zsh-autosuggestions
  F-Sy-H
)

alias sudo="sudo "

export NODE_OPTIONS="--max-old-space-size=8192"

export all_proxy="socks://192.168.199.116:4780"
export http_proxy="http://192.168.199.116:4780"
export https_proxy="http://192.168.199.116:4780"
alias proxy_unset="unset all_proxy && unset http_proxy && unset https_proxy"
alias proxy_set="export all_proxy="socks://192.168.199.116:4780" && export http_proxy="http://192.168.199.116:4780" && export https_proxy="http://192.168.199.116:4780""
alias editor=subl

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NODE_PATH="$(npm root --global)"

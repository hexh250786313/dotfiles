# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH_DISABLE_COMPFIX="true" # 如果报了 completion 的错就打开，否则注释掉
export ZSH="/home/hexh/.oh-my-zsh"
export EDITOR=nvim
export REACT_EDITOR=nvim

setopt globdots

plugins=(
  git
  wd
  zsh-autosuggestions
  fast-syntax-highlighting
  docker # docker 补全
  docker-compose # docker-compose 补全
)

alias sudo="sudo "

alias work="source ~/.config/my-config/sh/.work.sh"
alias server="source ~/.config/my-config/sh/.server.sh"
alias fluent-proxy="source ~/.config/my-config/sh/.fluent_proxy.sh"
alias hello="source ~/.config/my-config/sh/.hello.sh"
alias mine="source ~/.config/my-config/sh/.mine.sh"
alias lock='source ~/.config/my-config/sh/.lock.sh'

alias cache-free="sh -c 'echo 1 > /proc/sys/vm/drop_caches'"
alias landrop="sh -c '~/app/LANDrop-latest-linux.AppImage'"

ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

export NODE_OPTIONS="--max-old-space-size=8192"

export all_proxy="socks://127.0.0.1:4780"
export http_proxy="http://127.0.0.1:4780"
export https_proxy="http://127.0.0.1:4780"

eval "$(rbenv init - zsh)"

alias lc='colorls -lA --sd'
alias la='colorls -a --sd'
alias ll='colorls -l --sd'
alias ls='colorls --sd'

# Ctrl + z
function precmd()
{
  if [ -f /tmp/cd_vim ];then
    echo $(cat /tmp/cd_vim | head -n 1)
    cd $(cat /tmp/cd_vim | head -n 1)
    rm -rf /tmp/cd_vim
  fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

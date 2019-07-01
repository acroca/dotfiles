export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

CASE_SENSITIVE="true"

plugins=(git docker docker-compose golang helm httpie terraform kubectl)

export EDITOR="code --wait"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ERL_AFLAGS="-kernel shell_history enabled"

export PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="$HOME/.mix/escripts:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOBIN:$PATH"
export PATH="./bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="./env/bin:$PATH"
export PATH="/usr/local/Cellar/libpq/11.1/bin/:$PATH"

alias sync_drive="rsync -avh --ignore-existing"
alias e="code --wait"
alias spotify="spotify --force-device-scale-factor=2"

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

source ~/private.sh
source ~/.zshrc_functions

source $ZSH/oh-my-zsh.sh

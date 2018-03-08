export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

CASE_SENSITIVE="true"

plugins=(git docker go dotenv kubectl)

export EDITOR="code --wait"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ERL_AFLAGS="-kernel shell_history enabled"

export GOROOT="/usr/local/opt/go/libexec"
if [[ -z "${GOPATH}" ]]; then
  export GOPATH="$HOME/workspace/gocode"
fi
export GOBIN="$GOPATH/bin"
export PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="$HOME/.mix/escripts:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOBIN:$PATH"
export PATH="./bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="./env/bin:$PATH"

alias sync_drive="rsync -avh --ignore-existing"
alias e="code --wait"

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

source ~/private.sh
source ~/.zshrc_functions

source $ZSH/oh-my-zsh.sh

export ZSH=/Users/albert/.oh-my-zsh

ZSH_THEME="robbyrussell"

CASE_SENSITIVE="true"

plugins=(git docker go rvm)

export EDITOR="subl -n -w"
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="$HOME/workspace/gocode"
export PATH="$HOME/bin:/usr/local/opt/go/libexec/bin:$GOPATH/bin:$HOME/.rvm/bin:./node_modules/.bin:$HOME/.mix/escripts:$PATH"
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export PATH="./env/bin:$PATH"

alias ipfw_on="sudo ipfw pipe 1 config bw 64KByte/s delay 400ms && sudo ipfw add 1 pipe 1 src-port 3000"
alias ipfw_off="sudo ipfw delete 1"
alias sync="rsync -avh --ignore-existing"
alias e="subl -n -w"
source ~/private.sh
source ~/.zshrc_functions
source $ZSH/oh-my-zsh.sh

# For some reason `ls` doesn't have colors
alias ls="ls --color=tty"
unsetopt AUTO_CD

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ERL_AFLAGS="-kernel shell_history enabled"

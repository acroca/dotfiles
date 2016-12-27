export ZSH=/Users/albert/.oh-my-zsh

ZSH_THEME="robbyrussell"

CASE_SENSITIVE="true"

plugins=(git docker coffee brew go npm sublime)

export EDITOR="subl -n -w"
export GOROOT="$HOME/workspace/go"
export GOROOT_BOOTSTRAP="$HOME/workspace/go1.4"
export GOPATH="$HOME/workspace/gocode"
export PATH="$HOME/bin:$GOROOT/bin:$GOPATH/bin:$HOME/.rvm/bin:./node_modules/.bin:$PATH"
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export PATH="./env/bin:$PATH"

alias ipfw_on="sudo ipfw pipe 1 config bw 64KByte/s delay 400ms && sudo ipfw add 1 pipe 1 src-port 3000"
alias ipfw_off="sudo ipfw delete 1"
alias sync="rsync -avh --ignore-existing"
alias e="subl -n -w"
source ~/private.sh
source ~/.zshrc_functions
source $ZSH/oh-my-zsh.sh
unsetopt AUTO_CD

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

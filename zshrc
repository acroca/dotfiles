export ZSH=/Users/albert/.oh-my-zsh

ZSH_THEME="robbyrussell"

CASE_SENSITIVE="true"

plugins=(git docker coffee brew go npm sublime)

export EDITOR="atom -n"
export GOROOT="$HOME/workspace/go"
export GOROOT_BOOTSTRAP="$HOME/workspace/go1.4"
export GOPATH="$HOME/workspace/gocode"
export PATH="$HOME/bin:$GOROOT/bin:$GOPATH/bin:$HOME/.rvm/bin:./node_modules/.bin:$PATH"
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/albert/.boot2docker/certs/boot2docker-vm

alias ipfw_on="sudo ipfw pipe 1 config bw 64KByte/s delay 400ms && sudo ipfw add 1 pipe 1 src-port 3000"
alias ipfw_off="sudo ipfw delete 1"
alias sync="rsync -avh --ignore-existing"

source ~/private.sh
source $ZSH/oh-my-zsh.sh
unsetopt AUTO_CD

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

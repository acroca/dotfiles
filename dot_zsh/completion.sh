
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''

# Kubectl
source <(kubectl completion zsh)
complete -F __start_kubectl k

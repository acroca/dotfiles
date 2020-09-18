# LS
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }

# Take advantage of $LS_COLORS for completion as well.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


alias l='ls -lah'
alias k='kubectl'
alias tfswitch="/usr/local/bin/tfswitch -b /home/albert/bin/terraform"

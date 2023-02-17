# LS
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }

# Take advantage of $LS_COLORS for completion as well.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


alias l='ls -lah'
alias k='kubectl'
alias tfswitch="/usr/local/bin/tfswitch -b $HOME/bin/terraform"
alias copy_ip="curl -s ipinfo.io/ip | xclip -selection clipboard"
alias timecurl='curl -w "     time_namelookup:  %{time_namelookup}s\n        time_connect:  %{time_connect}s\n     time_appconnect:  %{time_appconnect}s\n    time_pretransfer:  %{time_pretransfer}s\n       time_redirect:  %{time_redirect}s\n  time_starttransfer:  %{time_starttransfer}s\n                     ----------\n          time_total:  %{time_total}s\n"'

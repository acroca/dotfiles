bindkey -e
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M emacs '^[[1;5D' backward-word

# autoload -U up-line-or-beginning-search
# zle -N up-line-or-beginning-search
# bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search

# autoload -U down-line-or-beginning-search
# zle -N down-line-or-beginning-search
# bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

autoload -U select-word-style
select-word-style bash

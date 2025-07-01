bindkey -e

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

autoload -U select-word-style
select-word-style bash

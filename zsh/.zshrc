source ~/.config/aliases
. /opt/asdf-vm/asdf.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000


function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

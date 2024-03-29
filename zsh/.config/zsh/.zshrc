#!/bin/sh
setopt appendhistory

zmodload zsh/zprof

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
setopt HIST_IGNORE_ALL_DUPS   # removes duplicates from zsh history
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"
zsh_add_file "zsh-tokens"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "lukechilds/zsh-nvm"
# zsh_add_completion "esc/conda-zsh-completion" false
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Map Caps Lock to Esc -> Arch
#-setxkbmap -option caps:escape

# Key-bindings
zle -N peco-history-selection
zle -N peco-src

bindkey -s '^o' 'ranger^M'
bindkey -s '^f' 'zi^M'
bindkey '^]' peco-src
bindkey '^R' peco-history-selection


# Starts zioxide
eval "$(zoxide init zsh)"

# Print welcome fortune
# fortune | cowsay | lolcat

# Loads sdkman - java
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

case `uname` in
  Darwin)
    # commands for OS X go her
    # For NVM setup - using zsh-nvm instead now
    # [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    # [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

    # Run Tmux on startup
    # if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [[ "$TERM_PROGRAM" != "vscode" ]]; then
    #   exec tmux
    # fi
  ;;
  Linux)
    # commands for Linux go here
    # For NVM setup - using zsh-nvm instead now
    # [ -s "/usr/share/nvm/init-nvm.sh"] && .\ "/usr/share/nvm/init-nvm.sh"   # This loads nvm
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac


zprof > ~/zsh-profiling.txt


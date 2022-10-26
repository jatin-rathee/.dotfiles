set fish_greeting # disable fish greeting

# env variables
set -U LANG en_US.UTF-8
set -U LC_ALL en_US.UTF-8

set -U GOPATH (go env GOPATH)
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux PNPM_HOME $HOME/.local/share/pnpm
set -Ux NODE_PATH $HOME/.nvm/versions/node/v16.17.1/bin/node
set -U EDITOR nvim

# added stuff to PATH

# importing machine-name based config (RZP1514 / arch)
# set host_config ~/.config/fish/config.(hostname).fish
# test -r $host_config; and source $host_config

switch (uname)
  case Linux
    # commands for Linux go here
  case Darwin
    # commands for OS X go her
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/sbin
  case FreeBSD NetBSD DragonFly
    echo Hi Beastie!
  case '*'
    echo Hi, stranger!
end

fish_add_path $PNPM_HOME
fish_add_path $GOPATH/bin
fish_add_path $HOME/.config/bin
fish_add_path $HOME/.nvm/versions/node/v16.16.0/bin
fish_add_path $HOME/.pyenv/shims

# init prompt, z and pyenv
starship init fish | source
zoxide init fish | source
# pyenv init - | source

# fish colors
set -U fish_color_autosuggestion black
set -U fish_color_command normal
set -U fish_color_error red
set -U fish_color_param cyan
set -U fish_color_redirections yellow
set -U fish_color_terminators white
set -U fish_color_valid_path green

# key bindings
function fish_user_key_bindings
  bind \c] peco_select_ghq      # Ctrl-]
  bind \cr peco_select_history  # Ctrl-r
  bind \co 'ranger'
end

# importing common aliases
source ~/.config/zsh/zsh-aliases

# private tokens
source ~/.config/fish/tokens.fish

# abbr's 
abbr tn "tmux new -s (pwd | sed 's/.*\///g')"
#!/bin/bash

# Network Manager Applet
nm-applet --indicator &

# Speedy keys
xset r rate 210 40

# Environment variables set everywhere
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave"

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Compositor
picom -b &

# remap caps to escape
setxkbmap -option caps:escape

# zsh config dir
export ZDOTDIR=$HOME/.config/zsh

exec awesome

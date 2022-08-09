ZDOTDIR=$HOME/.config/zsh

case `uname` in
  Darwin)
    # commands for OS X go here
    eval $(/opt/homebrew/bin/brew shellenv)
  ;;
  Linux)
    # commands for Linux go here
    startx
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac


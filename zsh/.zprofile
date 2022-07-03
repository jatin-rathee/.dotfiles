export ZDOTDIR=$HOME/.config/zsh

case `uname` in
  Darwin)
    # commands for OS X go here
    eval $(/opt/homebrew/bin/brew shellenv)
    # For Mac - React native setup
    export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
    export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
    export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
  ;;
  Linux)
    # commands for Linux go here
    startx
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac


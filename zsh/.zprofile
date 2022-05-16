#startx
export ZDOTDIR=$HOME/.config/zsh
eval $(/opt/homebrew/bin/brew shellenv)

# For Mac - React native setup
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
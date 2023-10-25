#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# NVM
# Install NVM

# Android SDK
# Install Android SDK
export ANDROID_HOME="$HOME/android/sdk"
export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

alias ls='ls --color=auto'
alias v='nvim'
alias lg='lazygit'

alias pkexec='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'

# Vim Ctrl+s Hang (if needed)
# disable Software Flow Control (XON/XOFF flow control)
# stty -ixon

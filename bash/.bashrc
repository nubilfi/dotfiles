#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Android SDK
export ANDROID_HOME="$HOME/android/sdk"
#export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# Gradle
export PATH=$PATH:$HOME/android/gradle/gradle-4.10.3/bin

# Vim Ctrl+s Hang
# disable Software Flow Control (XON/XOFF flow control)
stty -ixon

# Virtualenv
export PATH=$PATH:$HOME/.local/bin

alias nvimvue='nvim -u ~/.vimrc-vue'
alias nvimreact='nvim -u ~/.vimrc-react'
alias nvimpython='nvim -u ~/.vimrc-python'
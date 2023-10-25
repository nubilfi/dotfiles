#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PTOOLSPATH=/usr/bin/
export PATH=$PATH:/usr/bin

. "$HOME/.cargo/env"

#[[ $XDG_VTNR -le 2 ]] && exec tbsm
#[[ -n "$XDG_VTNR" && $XDG_VTNR -le 2 ]] && tbsm

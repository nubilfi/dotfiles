#!/bin/sh

DATE="$(date +" %{T3}%{T-} %d %b, %I:%M %p ")"

case "$1" in
    --popup)
        sh ~/.config/polybar/scripts/popup.sh
        ;;
    *)
        echo "$DATE"
        ;;
esac

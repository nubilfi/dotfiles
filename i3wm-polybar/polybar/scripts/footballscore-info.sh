#!/bin/bash

HOST=google.com

# Check for internet connectivity
if ! ping -q -c 1 -W 1 $HOST &> /dev/null
then
    # Display 0 ms with icon if there's no internet access
    icon="%{F#aa5a5b}%{T3}"
    echo "$icon"
fi

if ! ping=$(ping -n -c 1 -W 1 $HOST); then
    echo "%{F#aa5a5b}%{T3}"
else
    # Run the footballscore (fbs) command with the provided argument
    cli=$(fbs -k=xxx -c=xxx --next-match=1)

    ball_icon="%{F#8abeb7}%{F-}"
    cli_with_icon="$ball_icon $cli"

    OUTPUT="$cli_with_icon"

    case "$1" in
        --popup)
            sh ~/.config/polybar/scripts/popup-football.sh
            ;;
        *)
            echo "$OUTPUT"
            ;;
    esac
fi



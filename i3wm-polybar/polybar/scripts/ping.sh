#!/bin/sh

HOST=google.com

if ! ping=$(ping -n -c 1 -W 1 $HOST); then
    echo "%{F#BA2922}%{T3}%{T-}%{F-} 0 ms"
else
    rtt=$(echo "$ping" | sed -rn 's/.*time=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p')

    if [ "$rtt" -lt 50 ]; then
        icon="%{F#8abeb7}%{T3}%{T-}%{F-}"
    elif [ "$rtt" -lt 150 ]; then
        icon="%{F#faeb04}%{T3}%{T-}%{F-}"
    else
        icon="%{F#BA2922}%{T3}%{T-}%{F-}"
    fi

    echo "$icon $rtt ms"
fi

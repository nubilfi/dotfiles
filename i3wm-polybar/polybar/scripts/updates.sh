#!/usr/bin/env bash

BAR_ICON=""
NOTIFY_ICON=/usr/share/icons/Papirus/32x32/apps/system-software-update.svg

get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }

while true; do
    get_total_updates

    # notify user of updates
    if hash notify-send &>/dev/null; then
        if (( UPDATES > 50 )); then
            notify-send -u critical -i $NOTIFY_ICON \
                "You really need to update!!" "$UPDATES New packages"
        elif (( UPDATES > 25 )); then
            notify-send -u normal -i $NOTIFY_ICON \
                "You should update soon" "$UPDATES New packages"
        elif (( UPDATES > 2 )); then
            notify-send -u low -i $NOTIFY_ICON \
                "$UPDATES New packages"
        fi
    fi

    # when there are updates available
    # every 5 hours another check for updates is done
    while (( UPDATES > 0 )); do
        if (( UPDATES == 1 )); then
            echo " $UPDATES"
        elif (( UPDATES > 1 )); then
            echo " $UPDATES"
        else
            echo $BAR_ICON
        fi
        sleep 18000 # 5 hours
        get_total_updates
    done

    # when no updates are available, use a longer loop, this saves on CPU
    # and network uptime, only checking once every 12 hours for new updates
    while (( UPDATES == 0 )); do
        echo "$BAR_ICON $UPDATES"
        sleep 43200 # 12 hours
        get_total_updates
    done
done

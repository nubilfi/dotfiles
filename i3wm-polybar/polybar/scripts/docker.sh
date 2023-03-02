#!/bin/sh

UNIT="docker.service"
COUNT=0

while true; do
    ACTIVE="$(systemctl is-active "$UNIT")"
    if [ "$ACTIVE" = "active" ]; then
        # Count the number of running containers
        NEW_COUNT="$(docker ps --format '{{.ID}}' | wc -l | xargs)"
        # Update the count only if it has changed
        if [ "$NEW_COUNT" -ne "$COUNT" ]; then
            COUNT="$NEW_COUNT"
        fi
        # Print the count with a green icon
        echo "%{F#8abeb7} $COUNT%{F-}"
    else
        # Print an empty string with a red icon
        echo "%{F#aa5a5b}%{F-}"
        COUNT=0
    fi
    # Wait for a few seconds before checking again
    sleep 60
done

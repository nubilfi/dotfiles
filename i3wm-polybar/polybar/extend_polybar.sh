#!/bin/env sh

# enumerate the monitors
connected_monitors=$(polybar --list-monitors | wc -l)

if [ "$connected_monitors" -gt 1 ]; then
    for m in $(polybar --list-monitors | cut -d":" -f1); do
		pkill polybar

		sleep 2;
        MONITOR=$m polybar --reload i3wm_bar &
    done
fi

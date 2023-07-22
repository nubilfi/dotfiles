#!/bin/env sh

# enumerate the monitors
connected_monitors=$(polybar --list-monitors | wc -l)

if [ "$connected_monitors" -gt 1 ]; then
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
    
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload i3wm_bar &
    done
fi

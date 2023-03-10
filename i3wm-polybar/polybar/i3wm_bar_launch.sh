#!/bin/env sh

pkill polybar

sleep 1;

polybar i3wm_bar &

# Debug mode
# echo "---" | tee -a /tmp/polybar1.log
# polybar -l trace i3wm_bar >> /tmp/polybar1.log 2>&1 &

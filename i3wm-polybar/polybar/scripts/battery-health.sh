#!/bin/bash

capacity=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/capacity/ {gsub(/%/, ""); printf "%.0f", $2}')
normal_threshold=80
bottom_threshold=50
icon="%{F#8abeb7}%{T3}%{T-}%{F-}"

if (( $capacity > $normal_threshold )); then
  icon="%{F#8abeb7}%{T3}%{T-}%{F-}"
elif (( $capacity < $normal_threshold )); then
  icon="%{F#b5af63}%{T3}%{T-}%{F-}"
elif (( $capacity < $bottom_threshold )); then
  icon="%{F#BA2922}%{T3}%{T-}%{F-}"
fi

echo "$icon"

#!/bin/bash
# This scripts is optional, just in case if you want to get notify by pressing Caps Lock key
sleep 0.25
if [ $(xset q | grep "LED mask" | grep -Eco "[0]{8}") = 1 ];
then
        notify-send -i keyboard -t 3000 "Caps Lock" "Off";
else
        notify-send -i keyboard -t 3000 "Caps Lock" "On";
fi
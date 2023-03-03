#!/bin/bash
# Watch youtube from mpv
notify-send -t 3000 "Playing Video" "$(xclip -o)";
mpv --ytdl-format=bestvideo+bestaudio/best --fs --speed=2.5 --af=rubberband=pitch-scale=0.981818181818181 "$(xclip -o)"

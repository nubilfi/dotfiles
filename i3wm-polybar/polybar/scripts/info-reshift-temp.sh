#!/bin/sh

sleep 3s

display_icon() {
  # TODO: modified this later
  if [ "$(pgrep -x redshift)" ]; then
      temp=$(redshift -p 2> /dev/null | grep temp | cut -d ":" -f 2 | tr -dc "[:digit:]")

      if [ -z "$temp" ]; then
          echo ""
      elif [ "$temp" -ge 5000 ]; then
          echo ""
      elif [ "$temp" -ge 4000 ]; then
          echo ""
      else
          echo ""
      fi
  fi
}

run_app() {
  exec redshift &
}

if [ "$1" = "display" ]; then
  if [ "$(pgrep -x redshift)" ]; then
    notify-send "Redshift is still active."
  else
    exec redshift &
    notify-send "Activating redshift..."
  fi
elif [ "$1" = "kill" ]; then
  exec killall redshift
  notify-send "Deactivating redshift..."
else
  echo ""
fi

#!/bin/bash

while true
do
    width="$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/' | cut -f1 -d'x')";
    id="$(xdotool getwindowfocus)";
    geometry="$(xdotool getwindowfocus getwindowgeometry | grep -i geometry | cut -f2 -d':' | cut -f1 -d'x' | sed -e 's/^[[:space:]]*//')";

    if [[ $geometry == $width ]]; then
      state="xprop -id $id | grep _MOTIF_WM_HINTS | cut -f2 -d'=')";
      if [[ $state != " 2, 0, 0, 0, 0" ]]; then
          xprop -id $id -f _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS "0x2, 0x0, 0x0, 0x0, 0x0"
      fi
    fi

    sleep 5s;
done

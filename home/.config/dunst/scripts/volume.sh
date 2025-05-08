#!/usr/bin/env bash

arg=$1
ICON_DIR="$HOME/.config/hypr/scripts/assets"
VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)
repeat_delay=0.4

# Adjust volume
if [ "$1" == "I" ]; then
  pamixer -i 3
elif [ "$1" == "D" ]; then
  pamixer -d 3
else
  notify-send "Please use correct args (I/D)" --icon="$ICON_DIR/alert.svg"
  exit
fi

adjust_volume $arg

# Re-check volume after adjustment
VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)

# Decide icon and message
if [ "$MUTED" == "true" ] || [ "$VOLUME" -eq 0 ]; then
  ICON="muted.svg"
  MESSAGE="Muted"
elif [ "$VOLUME" -ge 100 ]; then
  ICON="volume-max.svg"
  MESSAGE="Full Volume"
else
  ICON="volume-max.svg"
  MESSAGE="Volume: $VOLUME"
fi

dunstify -h string:x-dunst-stack-tag:volume \
         -h int:value:"$VOLUME" \
         "$MESSAGE" \
         --icon="$ICON_DIR/$ICON"

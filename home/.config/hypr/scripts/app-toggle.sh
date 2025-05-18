#!/usr/bin/env bash
# argument 1
# - APP

APP_CLASS="$1"

if [ -z "$APP_CLASS" ]; then
  echo "Usage: $0 <window-class-name>"
  exit 1
fi

CLIENT=$(hyprctl clients -j | jq -c ".[] | select(.class == \"$APP_CLASS\")" | head -n1)

if [ -n "$CLIENT" ]; then
  ADDR=$(echo "$CLIENT" | jq -r '.address')
  WS=$(echo "$CLIENT" | jq -r '.workspace.id')
  hyprctl dispatch workspace "$WS"
  sleep 0.1
  hyprctl dispatch focuswindow address:$ADDR
else
  CMD=$(echo "$APP_CLASS" | cut -d'-' -f1 | tr '[:upper:]' '[:lower:]')
  "$CMD" &
fi

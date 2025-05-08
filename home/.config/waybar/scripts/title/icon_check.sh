#!/usr/bin/env bash
#

# Define the mapping between app names and symbols
declare -A SYMBOLS=(
  ["VSCodium"]=""
  ["vesktop"]=""
  ["kitty"]=""
  ["org.gnome.Nautilus"]=""
  ["gnome-disks"]="󱛟"
  ["firefox"]="󰈹"
)

# Get the app name
app_name=$(hyprctl activewindow | grep -oP 'class: \K[^\s]+')

# Check if app_name is null
if [ -z "$app_name" ]; then
  echo ""
else
  # Retrieve the symbol from the mapping
  symbol=${SYMBOLS[$app_name]}

  # Echo the symbol if it's not empty
  if [ -n "$symbol" ]; then
    echo "$symbol"
  fi
fi


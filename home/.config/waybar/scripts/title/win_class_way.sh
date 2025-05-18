#!/usr/bin/env bash

declare -A PKGS=(
  ["Brave-browser"]="Brave"
  ["codium"]="codium"
  ["com.github.FontManager.FontManager"]="Font Manager"
  ["com.obsproject.Studio"]="OBS Studio"
  ["com.Webcamoid."]="Camera"
  ["firefox"]="Firefox"
  ["kitty"]="kitty"
  ["net.lutris.Lutris"]="Lutris"
  ["org.gnome.Nautilus"]="File Manager"
  ["org.qbittorrent.qBittorrent"]="QBitTorrent"
  ["Picture in picture"]="PiP"
  ["steam"]="Steam"
  ["vesktop"]="Discord"
  ["VSCodium"]="VSCodium"
)

declare -A SYMBOLS=(
  ["Brave-browser"]=" "
  ["code-oss"]="󪥢 "
  ["codium"]=" "
  ["com.github.FontManager.FontManager"]="󰛖 "
  ["com.obsproject.Studio"]=" "
  ["com.Webcamoid."]="󰄀 "
  ["firefox"]="󰈹 "
  ["kitty"]=" "
  ["net.lutris.Lutris"]="󰊗 "
  ["org.gnome.Nautilus"]="󰉋 "
  ["org.qbittorrent.qBittorrent"]=" "
  ["Picture in picture"]="󰹙 "
  ["steam"]=" "
  ["vesktop"]=" "
  ["VSCodium"]=" "
)

app_name=$(hyprctl activewindow | grep -oP 'class: \K[^\s]+')

# Check if app_name is null
if [ -z "$app_name" ]; then
  class="noicon"
  symbol=" "
  pkg="Hypr"
else
  # Check if the app_name is a valid key in the PKGS array
  if [[ ${PKGS["$app_name"]+abc} ]]; then
    pkg=${PKGS["$app_name"]}
  else
    pkg=$app_name
  fi
    
  # Check if app_name is null
  if [ -z "$app_name" ]; then
    class="noicon"
    symbol=" "
    pkg="Hypr"
  else
    symbol=${SYMBOLS[$app_name]}
    if [ -z "$symbol" ]; then
      symbol=" "
    else
      class=$pkg
    fi
      
    if [ -z "$pkg" ] && [ -z "$symbol" ]; then
      class="noicon"
      symbol=" "
      pkg="Hypr"
    fi
  fi
fi

result="{\"text\":\""$pkg"\",\"alt\":\""$symbol"\",\"class\":\""$class"\"}"
echo -e $result
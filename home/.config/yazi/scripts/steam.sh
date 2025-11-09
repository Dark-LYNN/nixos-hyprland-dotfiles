#!/usr/bin/env bash
GAME_EXE_PATH="$(realpath "$1")"
GAME_DIR="$(dirname "$GAME_EXE_PATH")"
PROTON_DIR="/mnt/shared/Steam/steamapps/common/Proton - Experimental"
COMPAT_DATA_PATH="$HOME/.steam/steamapps/compatdata/123456"

export STEAM_COMPAT_CLIENT_INSTALL_PATH="$HOME/.steam/root"
export STEAM_COMPAT_DATA_PATH="$COMPAT_DATA_PATH"
export UNITY_DISABLE_DXVA=1

mkdir -p "$COMPAT_DATA_PATH"

# Create 64-bit prefix if it doesn't exist
if [ ! -d "$COMPAT_DATA_PATH/pfx" ]; then
    WINEARCH=win64 WINEPREFIX="$COMPAT_DATA_PATH" wineboot
fi

cd "$PROTON_DIR" || exit 1

# Install Media Foundation
protontricks -c "winetricks mf"
protontricks -c "winetricks mfplat"
protontricks -c "winetricks wmv9codecs"
protontricks -c "winetricks quartz"
protontricks -c "winetricks allcodecs"
protontricks -c "winetricks mfreadwrite"

# Convert Unity MP4 videos to VP8/WebM
find "$GAME_DIR" -type f -name "*.mp4" | while read -r VIDEO; do
    WEBM="${VIDEO%.mp4}.webm"
    # Skip if already converted
    if [ ! -f "$WEBM" ]; then
        echo "Converting $VIDEO -> $WEBM"
        ffmpeg -y -i "$VIDEO" -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis "$WEBM"
    fi
done

# Launch the game EXE with Proton
steam-run '/mnt/shared/Steam/steamapps/common/Proton - Experimental/proton' run "$GAME_EXE_PATH"

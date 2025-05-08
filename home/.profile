## ─────────────────────────────────────────────────────────────
## Default to BASH
## ─────────────────────────────────────────────────────────────
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

## ─────────────────────────────────────────────────────────────
## Theming
## ─────────────────────────────────────────────────────────────
export QT_QPA_PLATFORMTHEME="qt5ct"
export XDG_DATA_DIRS="/etc/profiles/per-user/$USER/share:/run/current-system/sw/share${XDG_DATA_DIRS:+:$XDG_DATA_DIRS}"
export XCURSOR_THEME="Vimix-cursors"
export XCURSOR_SIZE="24"

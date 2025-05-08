## ─────────────────────────────────────────────────────────────
## Main
## ─────────────────────────────────────────────────────────────
export ZSH=~/.oh-my-zsh

ZSH_THEME="pixegami-agnoster"
export UPDATE_ZSH_DAYS=7
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

## ─────────────────────────────────────────────────────────────
## Theming
## ─────────────────────────────────────────────────────────────
export QT_QPA_PLATFORMTHEME="qt5ct"
export XDG_DATA_DIRS="/etc/profiles/per-user/$USER/share:/run/current-system/sw/share${XDG_DATA_DIRS:+:$XDG_DATA_DIRS}"
export XCURSOR_THEME="Vimix-cursors"
export XCURSOR_SIZE="24"

## ─────────────────────────────────────────────────────────────
## NVM (Node Version Manager)
## ─────────────────────────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

## ─────────────────────────────────────────────────────────────
## pnpm
## ─────────────────────────────────────────────────────────────
export PNPM_HOME="/home/lynnux/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

## ─────────────────────────────────────────────────────────────
## qlty
## ─────────────────────────────────────────────────────────────
export QLTY_INSTALL="$HOME/.qlty"
export PATH="$QLTY_INSTALL/bin:$PATH"

## ─────────────────────────────────────────────────────────────
## aliases
## ─────────────────────────────────────────────────────────────
alias code='codium'  # I use vscodium and use 'code ./' for convenience


## ─────────────────────────────────────────────────────────────
## If not running interactively.
## ─────────────────────────────────────────────────────────────
case $- in
  *i*) ;;
  *) return;;
esac

## ─────────────────────────────────────────────────────────────
## Main
## ─────────────────────────────────────────────────────────────
HISTCONTROL=ignoreboth ## Ignore duplicate lines and lines starting with spaces
shopt -s histappend    ## Append to history file
HISTSIZE=1000          ## history length
HISTFILESIZE=2000      ## history file length
shopt -s checkwinsize  ## check the window size

## ─────────────────────────────────────────────────────────────
## Color Support
## ─────────────────────────────────────────────────────────────
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  # alias dir='dir --color=auto'
  # alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

## ─────────────────────────────────────────────────────────────
## aliases
## ─────────────────────────────────────────────────────────────
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias code='codium'

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

## ─────────────────────────────────────────────────────────────
## Theming
## ─────────────────────────────────────────────────────────────
export DISPLAY=:0
export QT_QPA_PLATFORMTHEME="qt5ct"
export WAYDROID_USE_X11=1
unset WAYLAND_DISPLAY
export XDG_DATA_DIRS="/etc/profiles/per-user/$USER/share:/run/current-system/sw/share${XDG_DATA_DIRS:+:$XDG_DATA_DIRS}"
export XCURSOR_THEME="Vimix-cursors"
export XCURSOR_SIZE="24"

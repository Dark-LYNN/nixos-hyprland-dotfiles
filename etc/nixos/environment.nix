{ config, pkgs, ... }:

## ─────────────────────────────────────────────────────────────
## Installed Packages
## ─────────────────────────────────────────────────────────────

## Import unstable versions, use "unstable.<package>" to import an unstable package.
## See https://search.nixos.org for packages
let unstable =
  import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/master.tar.gz";
  }) {};

in {
  ## Allow unfree packages being installed.
  nixpkgs.config.allowUnfree = true;

  ## Packages ~ Installs on "nix-rebuild"
  environment.systemPackages = with pkgs; [
    appimage-run         # Run .appimage
    blueman              # Bluetooth GUI
    bluez                # Bluetooth Manager
    bluez-tools          # Bluetooth Tools
    brave                # Chromium Browser
    brightnessctl        # Brightness Manager
    bsdgames             # games from NetBSD
    curl                 # transferring files with URL syntax
    dconf                # GSettings Backend
    dunst                # Notification Manager
    ffmpeg               # Video Processing/Encoding
    firefox              # Browser
    font-manager         # Font Manager
    fuse                 # interface for userspace programs
    gimp                 # Image Software
    git                  # GIT CLI
    go                   # Go
    glib                 # GSettings
    gnome-disk-utility   # Disk utilities
    gnome-keyring        # Keyring for sencitive data
    greetd.tuigreet      # Login Manager
    grimblast            # Grim Wrapper (Screenshots)
    gsettings-desktop-schemas # Collection of GSettings schemas
    gvfs                 # Virtual File Manager
    hyprland             # Tiling Window Manager
    kdePackages.qt6ct    # qt6
    killall              # KillAll processes
    kitty                # Terminal Emulator
    libnotify            # Notifications
    libsForQt5.qt5ct     # qt5 
    lsof                 # list open files
    nautilus             # File Manager
    neofetch             # Neofetch
    nerdfonts            # Fonts from nerdfonts for icons etc.
    networkmanager_dmenu # GUI For network Mangager
    ntfs3g               # NTFS File Formats
    obs-cmd              # OBS CLI
    obs-studio           # Video Recording
    openjdk17            # JAVA
    pavucontrol          # Volume Control Tool
    pamixer              # Volume Control CLI
    playerctl            # Media control
    polkit               # Authentication Agent
    pulseaudio           # Sound Server
    python3              # Python
    python3Packages.pip  # Python Package Manager
    swaybg               # Background Manager
    udisks2              # Storage Manager
    usbutils             # USB Utils
    v4l-utils            # Video Devices Manager
    vesktop              # Discord Client
    vscodium             # VSCode
    waybar               # Navbar
    webcamoid            # Webcam GUI
    wget                 # retrieve files over HTTP/HTTPS/FTP
    wine                 # Run exe files
    wl-clipboard         # ClipBoard Manager
    wofi                 # Rofi for WayLand
    xdg-desktop-portal   # portal frontend
    xdg-desktop-portal-hyprland # ^ But for hyprland specificly
    unstable.ytmdesktop  # Youtube Music Desktop APP
    zsh
  ];
  
  ## ─────────────────────────────────────────────────────────────
  ## Environment Variables
  ## ─────────────────────────────────────────────────────────────

  ## Set session type to Wayland (used by some apps to determine rendering backend)
  environment.variables.XDG_SESSION_TYPE = "wayland";

  ## Extra environment variables for Wayland and NVIDIA compatibility.
  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";        ## Fixes invisible/missing cursor
    LIBVA_DRIVER_NAME = "nvidia";         ## Forces VA-API to use the NVIDIA backend
    __GLX_VENDOR_LIBRARY_NAME = "nvidia"; ## Tells GLX to use the NVIDIA vendor library
  };

  ## ─────────────────────────────────────────────────────────────
  ## Fonts
  ## ─────────────────────────────────────────────────────────────
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    font-awesome
  ];
}

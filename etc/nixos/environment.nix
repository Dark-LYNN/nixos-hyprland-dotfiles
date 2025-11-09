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
  nixpkgs.config.permittedInsecurePackages = ["electron-33.4.11"];

  ## Packages ~ Installs on "nix-rebuild"
  environment.systemPackages = with pkgs; [
    appimage-run         # Run .appimage
    blueman              # Bluetooth GUI
    bluez                # Bluetooth Manager
    bluez-tools          # Bluetooth Tools
    brightnessctl        # Brightness Manager
    ckb-next             # Corsair Stuff
    curl                 # transferring files with URL syntax
    dconf                # GSettings Backend
    direnv               # Directory custom environments
    docker               # Docker
    docker-compose       # Docker Compose
    dunst                # Notification Manager
    ffmpeg               # Video Processing/Encoding
    firefox              # Browser   
    font-manager         # Font Manager
    fuse                 # interface for userspace programs
    gimp                 # Image Software
    git                  # GIT CLI
    glib                 # C library for programming building blocks
    go                   # Go
    glib                 # GSettings
    glow                 # Markdown viewer in terminal
    gnome-disk-utility   # Disk utilities
    gnome-keyring        # Keyring for sencitive data
    greetd.tuigreet      # Login Manager
    grimblast            # Grim Wrapper (Screenshots)
    gsettings-desktop-schemas # Collection of GSettings schemas
    gvfs                 # Virtual File Manager
    hyprland             # Tiling Window Manager
    jq                   # CLI JSON processor
    kdePackages.qt6ct    # qt6
    killall              # KillAll processes
    kitty                # Terminal Emulator
    libnotify            # Notifications
    libsForQt5.qt5ct     # qt5 
    lsof                 # list open files
    mediainfo            # View Media Info on Videos and audio files
    mpv                  # Video Player
    nautilus             # File Manager
    neofetch             # Neofetch
    nerdfonts
    networkmanager_dmenu # GUI For network Mangager
    nix-direnv
    ntfs3g               # NTFS File Formats
    obs-cmd              # OBS CLI
    openjdk17            # JAVA
    openssl              # Library for SSL
    pavucontrol          # Volume Control Tool
    pamixer              # Volume Control CLI
    playerctl            # Media control
    polkit               # Authentication Agent
    pulseaudio           # Sound Server
    qbittorrent          # Torrenting
    swaybg               # Background Manager
    tree                 # File Tree
    udisks2              # Storage Manager
    usbutils             # USB Utils
    v4l-utils            # Video Devices Manager
    waybar               # Navbar
    webcamoid            # Webcam GUI
    wget                 # retrieve files over HTTP/HTTPS/FTP
    wgnord               # Use wireguard for nordvpn
    wine                 # Run exe files
    wireguard-tools      # CLI for wireguard
    wl-clipboard         # ClipBoard Manager
    wofi                 # Rofi for WayLand
    xdg-desktop-portal   # portal frontend
    xdg-desktop-portal-gtk  # ^ But for gtk
    xdg-desktop-portal-hyprland # ^ But for hyprland specificly
    unstable.yazi        # CLI File Manager
    zsh                  # ZSH shell

    ruby_3_2
    gcc
    temurin-bin-8  # Java 8
  ];
    
  ## ─────────────────────────────────────────────────────────────
  ## Environment Variables
  ## ─────────────────────────────────────────────────────────────

  ## Extra environment variables for Wayland and NVIDIA compatibility.
  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";        ## Fixes invisible/missing cursor
    LIBVA_DRIVER_NAME = "nvidia";         ## Forces VA-API to use the NVIDIA backend
    __GLX_VENDOR_LIBRARY_NAME = "nvidia"; ## Tells GLX to use the NVIDIA vendor library
    XDG_SESSION_TYPE = "wayland";         ## Tells XDG software we are using wayland
    BROWSER = "brave";                    ## Use Brave as default browser
    DEFAULT_BROWSER = "brave";            ## Use Brave as default browser
  };

  # Enable gamemode used by some apps/games.
  programs.gamemode.enable = true;

  ## ─────────────────────────────────────────────────────────────
  ## Fonts
  ## ─────────────────────────────────────────────────────────────
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    font-awesome
  ];
}

{ config, pkgs, import, ... }:

{

  ## ─────────────────────────────────────────────────────────────
  ## XDG Settings
  ## ─────────────────────────────────────────────────────────────
  xdg.portal = {
    enable = true;
    config = {
      common.default = "hyprland";
      hyprland = {
        default = "wlr";
      };
    };
    extraPortals = [ 
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-hyprland
    ];
    configPackages = [ pkgs.hyprland ];
  };

  ## ─────────────────────────────────────────────────────────────
  ## Xserver Settings
  ## ─────────────────────────────────────────────────────────────
  services.xserver = {
    enable = true;                            ## Enable Xserver
    desktopManager.plasma5.enable = false;    ## Disable Plasma5 desktop environment
    videoDrivers = [ "nvidia" ];              ## Use NVIDIA proprietary drivers
    xkb = {
      layout = "us";                          ## Set the keyboard layout to US
      variant = "";                           ## No variant (US English without variations)
    };
  };

  ## ─────────────────────────────────────────────────────────────
  ## Enabled Services
  ## ─────────────────────────────────────────────────────────────
  ## services.waydroid.enable = true;		## Enable Waydroid
  services.flatpak.enable = true;               ## Enable Flatpak
  services.displayManager.sddm.enable = true;   ## Enable displayManger SDDM
  services.udisks2.enable = true;  ## Allows the system to automatically manage and mount disks.
  services.blueman.enable = true;  ## Enable Blueman for Bluetooth management.
  services.dbus.enable = true;     ## Enable the D-Bus message bus (communication between services)
  services.gvfs.enable = true;     ## Allow integration with GVFS (helps with file management)
  services.tumbler.enable = true; ## Allowe tumbler intergration
  services.greetd = {
    enable = true;                 ## Enable greetd
    settings = {
      default_session = {
        command = "Hyprland";      ## Launch Hyprland.
        user = "lynnux";           ## The user to log in as.
      };
    };
  };

  ## ─────────────────────────────────────────────────────────────
  ## Enabled Settings
  ## ─────────────────────────────────────────────────────────────
  programs.steam.enable = true;    ## Enable Steam
  programs.steam.gamescopeSession.enable = true; # Enables Steam in a gamescope Wayland session for better fullscreen
  programs.hyprland.enable = true; ## Enable Hyprland
  programs.seahorse.enable = true; ## Enable Seahorse
  programs.xwayland.enable = true;       ## Enable XWayland
  programs.zsh = {
    enable = true;              ## Enable Zsh as the default shell
    ohMyZsh = {
      enable = true;            ## Enable Oh-My-Zsh
      theme = "agnoster";       ## Use agnoster theme for Zsh
      plugins = [ "git" "z" ];  ## Enable plugins for Git and 'z' (for auto-navigation to frequently used directories)
    };
  };
}

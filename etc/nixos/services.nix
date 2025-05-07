{ config, pkgs, ... }:

{

  ## ─────────────────────────────────────────────────────────────
  ## XDG Settings
  ## ─────────────────────────────────────────────────────────────
  xdg.portal = {
    enable = true;
    config = {
      hyprland = {
        default = "wlr";
      };
    };
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
    configPackages = [ pkgs.hyprland ];
  };

  ## ─────────────────────────────────────────────────────────────
  ## Xserver Settings
  ## ─────────────────────────────────────────────────────────────
  services.flatpak.enable = true;  ## Enable Flatpak support
  services.xserver.enable = true;  ## Enable Xserver
  services.displayManager.sddm.enable = true;             ## Enable SDDM (login manager)
  services.xserver.desktopManager.plasma5.enable = false; ## Disable Plasma5 desktop environment
  services.xserver.videoDrivers = [ "nvidia" ];           ## Use NVIDIA proprietary drivers
  ## keyboard layout
  services.xserver.xkb = {
    layout = "us";   ## Set the keyboard layout to US
    variant = "";    ## No variant (US English without variations)
  };

  ## ─────────────────────────────────────────────────────────────
  ## Enabled Services
  ## ─────────────────────────────────────────────────────────────
  services.udisks2.enable = true;  ## Allows the system to automatically manage and mount disks.
  services.blueman.enable = true;  ## Enable Blueman for Bluetooth management.
  services.dbus.enable = true;     ## Enable the D-Bus message bus (communication between services)
  services.gvfs.enable = true;     ## Allow integration with GVFS (helps with file management)

  ## Use greetd as login manager.
  services.greetd = {
    enable = true;            ## Enable greetd
    settings = {
      default_session = {
        command = "Hyprland"; ## Launch Hyprland.
        user = "lynnux";      ## The user to log in as.
      };
    };
  };

  ## ─────────────────────────────────────────────────────────────
  ## Enabled Settings
  ## ─────────────────────────────────────────────────────────────
  programs.steam.enable = true;    ## Enable Steam
  programs.hyprland.enable = true; ## Enable Hyprland
  programs.seahorse.enable = true; ## Enable Seahorse
  programs.zsh = {
    enable = true;              ## Enable Zsh as the default shell
    ohMyZsh = {
      enable = true;            ## Enable Oh-My-Zsh
      theme = "agnoster";       ## Use agnoster theme for Zsh
      plugins = [ "git" "z" ];  ## Enable plugins for Git and 'z' (for auto-navigation to frequently used directories)
    };
  };
}

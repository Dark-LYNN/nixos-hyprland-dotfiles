{ config, pkgs, ... }:

let
  ## Import nixos-25.05
  nixos-25-05 = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-25.05.tar.gz") {
    config = config.nixpkgs.config;
    system = pkgs.system;
  };
  ## Import unstable (master branch)
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/master.tar.gz") {
    config = config.nixpkgs.config;
    system = pkgs.system;
  };
in

{
  ## ─────────────────────────────────────────────────────────────
  ## User Settings
  ## ─────────────────────────────────────────────────────────────

  ## Create user called 'lynnux'
  users.users.lynnux = {
    isNormalUser = true;      ## A none-root user.
    shell = pkgs.zsh;         ## Use Zsh as the default shell for this user.
    description = "Lynnux";   ## Description of user.
    extraGroups = [ "networkmanager" "wheel" "storage" "plugdev" "docker"]; # Add user to specified groups
    group = "lynnux";         ## Primary group of the user
    packages = with pkgs; [
      android-tools
      rofimoji
      neovim
      godot_4
      zoxide
      fzf
      dotnet-sdk
      obsidian
      unityhub
      mangohud
      gamescope
      protontricks
      gamemode
      vulkan-tools
      libpulseaudio
      libxcrypt-legacy
      scrcpy
      nodejs_23
      pnpm_10
      filebrowser
      ffmpegthumbnailer
      gvfs
      simple-mtpfs
      libmtp
      jmtpfs
      p7zip
      yt-dlp
      sshfs
      exiftool
      snixembed
      dbeaver-bin
      zathura
      unrar-wrapper
      zenity
      tinyxxd
      adwaita-icon-theme
      neovim
      waydroid
      unstable.ytmdesktop
      obs-studio           # Video Recording
      vesktop              # Discord Client
      vscodium             # VSCode
      brave                # Chromium Browser
      viu
      winetricks
      wine64
      nexusmods-app

      # ─── Skeuos GTK Theme ───────────────────────────────────────────────
      (pkgs.stdenv.mkDerivation rec {
        pname = "skeuos-gtk";
        version = "latest";

        src = pkgs.fetchFromGitHub {
          owner = "daniruiz";
          repo = "skeuos-gtk";
          rev = "20220629";
          sha256 = "0v6gxabqzyc7jizfxlvvvf1n7in20vmhnnv5s4ghgqrsygmmxxbi";
        };

        installPhase = ''
          mkdir -p $out/share/themes
          cp -r themes/Skeuos-Blue-Dark $out/share/themes/
        '';
      })
      papirus-icon-theme
    ];
  };


  services.gvfs.enable = true;

  programs.yazi.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  ## ─────────────────────────────────────────────────────────────
  ## Group Settings
  ## ─────────────────────────────────────────────────────────────
  ## Create group called 'lynnux'
  users.groups.lynnux = {
    gid = 1000;   ## The GID of the 'lynnux' group
    ## (Used 1000 since this is the same gid i have on ubuntu.)
  };
}

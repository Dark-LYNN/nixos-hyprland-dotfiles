{ config, pkgs, ... }:

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
      obsidian
      mangohud
      gamescope
      gamemode
      vulkan-tools
      libpulseaudio
      libxcrypt-legacy
      scrcpy
      nodejs_23
      pnpm_10
      filebrowser
      xfce.thunar
      xfce.thunar-archive-plugin
      xfce.thunar-volman
      xfce.tumbler
      ffmpegthumbnailer
      gvfs
      simple-mtpfs
      libmtp
      jmtpfs
      p7zip
      yt-dlp
      python3Packages.pypresence
      sshfs
      exiftool
      snixembed
      dbeaver-bin
      zathura

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

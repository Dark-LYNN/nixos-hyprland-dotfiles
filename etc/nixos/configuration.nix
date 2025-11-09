{ config, pkgs, inputs, ... }:

{
  ## Import modular .nix files to keep this file clean.
  imports = [
    ./automation.nix
    ./environment.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./mountpoints.nix
    ./security.nix
    ./services.nix
    ./users.nix
  ];

  ## ─────────────────────────────────────────────────────────────
  ## Bootloader
  ## ─────────────────────────────────────────────────────────────
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ]; ## Enables v4l2loopback kernel module (virtual camera devices)
  boot.kernelPackages = pkgs.linuxPackages;          ## Uses the default Linux kernel provided by Nixpkgs
  boot.kernelModules = [ "v4l2loopback" ];           ## Loads the v4l2loopback module at boot
  boot.kernelParams = [ "v4l2loopback.devices=1" ];  ## Ensures one virtual camera device is created
  boot.loader.grub.enable = true;           ## Enable GRUB bootloader
  boot.loader.grub.device = "/dev/nvme0n1"; ## Which partition GRUB bootloader is on.
  boot.loader.grub.useOSProber = true;      ## Allows GRUB to detect and list other OSes

  ## ─────────────────────────────────────────────────────────────
  ## Networking
  ## ─────────────────────────────────────────────────────────────
  networking.hostName = "nixos";           ## hostname of machine
  networking.networkmanager.enable = true; ## Enable NetworkManager for managing connections
  networking.firewall.enable = true;       ## Enable built-in firewall
  networking.wireless.enable = true;       ## Enable wireless connections

  ## Optional firewall settings (open ports if needed)
  ## networking.firewall.allowedTCPPorts = [ ];
  # networking.firewall.allowedUDPPorts = []

  ## ─────────────────────────────────────────────────────────────
  ## Localization
  ## ─────────────────────────────────────────────────────────────
  time.timeZone = "Europe/Madrid";     ## system time zone
  i18n.defaultLocale = "en_US.UTF-8";  ## Primary locale

  ## regional settings (e.g., number format, dates)
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "en_DK.UTF-8";
  };

  ## ─────────────────────────────────────────────────────────────
  ## virtualisation
  ## ─────────────────────────────────────────────────────────────
  virtualisation.waydroid.enable = true;

  ## ─────────────────────────────────────────────────────────────
  ## Version Lock
  ## ─────────────────────────────────────────────────────────────
  system.stateVersion = "24.11";
  ## DO NOT CHANGE THIS.
  ## It tells NixOS which feature set to expect for backwards compatibility.
}


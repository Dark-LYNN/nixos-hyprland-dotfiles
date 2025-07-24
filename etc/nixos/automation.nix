{ pkgs, lib, ...}:

{
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "monthly";

  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;
}

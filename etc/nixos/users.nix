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
    extraGroups = [ "networkmanager" "wheel" "storage" "plugdev" ]; # Add user to specified groups
    group = "lynnux";         ## Primary group of the user
    packages = with pkgs; [
      obsidian
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

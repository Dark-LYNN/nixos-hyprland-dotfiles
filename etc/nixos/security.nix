{ config, pkgs, ... }:

{ 
  ## ─────────────────────────────────────────────────────────────
  ## System Packages
  ## ─────────────────────────────────────────────────────────────

  ## Adding the Polkit GNOME package, which provides the authentication agent for GNOME
  environment.systemPackages = with pkgs; [  
    polkit    ## Auth agent
  ];

  ## ─────────────────────────────────────────────────────────────
  ## GNOME Keyring Service
  ## ─────────────────────────────────────────────────────────────
  ## Enabling GNOME Keyring (used to store/manage secrets)
  services.gnome.gnome-keyring.enable = true;
  
  ## ─────────────────────────────────────────────────────────────
  ## PAM (Pluggable Authentication Modules) Configuration
  ## ─────────────────────────────────────────────────────────────
  ## Configuring the PAM service for GNOME Keyring.
  security.pam.services = {  
    login.enableGnomeKeyring = true; # Ensure keyring is unlocked when logged in
  };
  
  ## ─────────────────────────────────────────────────────────────
  ## Polkit GNOME Authentication Agent Service
  ## ─────────────────────────────────────────────────────────────
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "Polkit GNOME Authentication Agent"; ## Description of the service
    wantedBy = [ "graphical-session.target" ];         ## Service should start after graphical session
    after = [ "graphical-session.target" ];            ## Ensure service runs only after the graphical session is started

    serviceConfig = {
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"; ## Path to the Polkit agent
      Restart = "on-failure";  ## Restart the service if it fails
    };
  };
}
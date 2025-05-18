{ config, pkgs, ... }:

{
  ## ─────────────────────────────────────────────────────────────
  ## System Settings
  ## ─────────────────────────────────────────────────────────────
  systemd.services.v4l2loopback = {
    description = "Load v4l2loopback module"; # name for the service
    wantedBy = [ "multi-user.target" ];       # Ensure service starts after system boot
    serviceConfig.execStart = "modprobe v4l2loopback devices=1"; # Load v4l2loopback module to create a virtual webcam device
  };

  ## ─────────────────────────────────────────────────────────────
  ## Hardware settings
  ## ─────────────────────────────────────────────────────────────
  ## (Yes i have a NVIDIA gpu, it was bought before i used linux don't hate.)

  ## NVIDIA Driver Configuration (for NVIDIA graphics cards)
  hardware.nvidia = {
    modesetting.enable = true;      # Enable modesetting for NVIDIA driver
    nvidiaSettings = true;          # Ensure NVIDIA settings are available
    open = true;                    # Allows open-source NVIDIA drivers
    powerManagement.enable = false; # Disables power management for the GPU
    package = config.boot.kernelPackages.nvidiaPackages.stable; # Selects a stable version of the NVIDIA driver package for compatibility.
  };

  ## ─────────────────────────────────────────────────────────────
  ## Graphics Configuration
  ## ─────────────────────────────────────────────────────────────
  hardware.graphics = {
    enable = true;      # Ensure the graphics subsystem is enabled.
    enable32Bit = true; # Enable 32-bit graphics support.
  };

  ## ─────────────────────────────────────────────────────────────
  ## Bluetooth Configuration
  ## ─────────────────────────────────────────────────────────────
  hardware.bluetooth.enable = true;      # Enables Bluetooth support
  hardware.bluetooth.powerOnBoot = true; # Start Bluetooth on startup

  ## ─────────────────────────────────────────────────────────────
  ## Software
  ## ─────────────────────────────────────────────────────────────
  hardware.ckb-next.enable = true;       # Enable ckb-next (Corsair Peripherals)

}

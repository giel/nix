{ config, lib, pkgs, modulesPath, ... }:

{

  services = {
    # Enable the X11 windowing system.
    xserver = {
      # Enable the xfce Desktop Environment.
      displayManager.lightdm.enable = true;
      desktopManager.xfce = {
        enable = true;
      };
    };
  };

  # Enable dconf for programs that might need it
  programs.dconf.enable = true;

}

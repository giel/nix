{ config, lib, pkgs, modulesPath, ... }:

{
  services = {
    thermald.enable = true;

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      # Configure keymap in X11
      layout = "us";
      xkbVariant = "euro";
      xkbOptions = "caps:escape";
      # xkbVariant = "eurosign:e";
      libinput = {
        enable = true;
        touchpad = {
          tapping = true;
          scrollMethod = "twofinger";
          naturalScrolling = true; # The correct way of scrolling
          accelProfile = "adaptive"; # Speed settings
          #accelSpeed = "-0.5";
          disableWhileTyping = true;
        };
      };

    };

  };

}

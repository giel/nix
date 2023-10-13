{ config, lib, pkgs, modulesPath, ... }:

{
  services = {
    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      # Configure keymap in X11
      layout = "us";
      # see also desktop/gnome for similair settings that are needed for gnome
      xkbVariant = "euro";
      xkbOptions = "caps:escape";
      libinput = { enable = true; };
    };

  };

}

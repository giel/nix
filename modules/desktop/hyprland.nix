{ config, lib, pkgs, modulesPath, ... }:

{

  services = {
    # displayManager.gdm.enable = true;
    # displayManager.ssdm.enable = true;
    # displayManager.defaultSession = "xfce";
  };

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  environment = {
    # extra Hyprland packages
    systemPackages = with pkgs; [
      blueman
      font-awesome
      hyprland
      roboto
      rofi
      toybox # for killall in restart waybar
      waybar
      wofi
    ];
  };

  # Enable dconf for programs that might need it
  programs.dconf.enable = true;

}

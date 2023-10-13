{ config, lib, pkgs, modulesPath, ... }:

{
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

# todo system tray / taskbar for wifi

  # Enable dconf for programs that might need it
  programs.dconf.enable = true;

}

{ pkgs, ... }:

{
  programs = {
    hyprland.enable = true;
    hyprland.xwayland.enable = true;
    # Enable dconf for programs that might need it
    dconf.enable = true;
  };

  # The login manager is not enabled here. Hyprland will popup in the login manager of 
  # KDE or Gnome. If none of those are installed as well choose the login manager of KDE.
  # see `login_manager.nix`.

  environment = {
    # extra Hyprland packages
    systemPackages = with pkgs; [
      blueman
      font-awesome
      gnome.gnome-keyring
      gnome.zenity
      hyprland
      hyprland-protocols
      hyprpaper
      networkmanagerapplet
      roboto
      rofi
      swaybg
      swaynotificationcenter
      toybox # for killall in restart waybar
      waybar
      wofi
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-utils
      xfce.thunar
    ];
  };

  # todo system tray / taskbar for wifi
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
}

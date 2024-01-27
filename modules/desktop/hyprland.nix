{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    #  layout = "us";
    #  xkbVariant = "";
    #  enable = true;
    # displayManager.sddm = {
    #   enable = true;
    #   theme = "maya";
    #   autoNumlock = true;
    # };
  };

  environment = {
    # extra Hyprland packages
    systemPackages = with pkgs; [
      blueman
      libsForQt5.dolphin
      font-awesome
      gnome.gnome-keyring
      hyprland
      networkmanagerapplet
      roboto
      rofi
      toybox # for killall in restart waybar
      waybar
      wofi
      xdg-desktop-portal-hyprland
    ];
  };

  # todo system tray / taskbar for wifi

  # Enable dconf for programs that might need it
  programs.dconf.enable = true;

}

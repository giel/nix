{ pkgs, config, ... }:
# meant as a generic login manager
let
  isGdmNeeded =
    config.services.desktopManager.gnome.enable ||
    config.services.xserver.desktopManager.budgie.enable;
  isSddmNeeded =
    config.services.desktopManager.plasma6.enable ||
    pkgs.programs.hyprland.enable ||
    pkgs.programs.niri.enable;
in
{

  services = {
    # Enable SSDM display managere for set of:
    # - KDE Plasma Desktop Environment.
    # - Hyprland
    # - xfce
    # - i3
    displayManager.sddm.enable = isSddmNeeded;

    # Enable the GNOME display manager for:
    # - GNOME Desktop Environment
    # - Budgie
    displayManager.gdm.enable = isGdmNeeded;

  };

  environment = {
    # greetd as login manager
    systemPackages = with pkgs; [
      greetd
      tuigreet
    ];
  };

  services.greetd = {
    enable = false;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/Hyprland";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    zsh
    bash
    Hyprland
  '';

}

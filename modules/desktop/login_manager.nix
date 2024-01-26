{ pkgs, ... }:
# meant as a generic login manager
{
  services = {
    # Enable the X11 windowing system.
    xserver = {
      # Enable the X11 windowing system.
      enable = true;

      # Enable SSDM display managere for set of:
      # - KDE Plasma Desktop Environment.
      # - Hyprland
      # - xfce
      # - i3
      # displayManager.sddm.enable = true;

      # Enable the GNOME display manager for:
      # - GNOME Desktop Environment
      # - Budgie
      displayManager.gdm.enable = true;

    };
  };
  environment = {
    # greetd as login manager
    systemPackages = with pkgs; [
      greetd.greetd
      greetd.tuigreet
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

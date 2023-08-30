{ config, lib, pkgs, modulesPath, ... }:

{

  services = {
    # Enable the X11 windowing system.
    xserver = {
      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

  environment = {
    # extra Gnome packages
    systemPackages = with pkgs; [
      gnome.dconf-editor
      gnome.gnome-shell-extensions
      gnome.gnome-tweaks
    ];
    # Gnome ignored packages
    gnome.excludePackages = (with pkgs; [ gnome-tour ]) ++ (with pkgs.gnome; [
      geary
      gnome-calendar
      gnome-contacts
      gnome-initial-setup
    ]);
  };

  # Enable dconf for programs that might need it
  programs.dconf.enable = true;

  home-manager = {
    users.giels = { pkgs, ... }: {

      dconf.settings = {
        "org/gnome/shell" = {
          favorite-apps = [
            "org.gnome.Settings.desktop"
            "Alacritty.desktop"
            "firefox.desktop"
            "org.gnome.Nautilus.desktop"
            "org.remmina.Remmina.desktop"
            "virt-manager.desktop"
          ];
          disable-user-extensions = false;
          disabled-extensions = "disabled";
          enabled-extensions = [
            "caffeine@patapon.info"
            "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
            "native-window-placement@gnome-shell-extensions.gcampax.github.com"
            "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
          ];
        };
        "org/gnome/desktop/interface" = {
          clock-show-weekday = true;
          font-antialiasing = "grayscale";
          font-hinting = "slight";
        };
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,maximize,close";
          resize-with-right-button = true;
          num-workspaces = 4;
        };
        "org/gnome/desktop/peripherals/touchpad" = {
          tap-to-click = true;
          two-finger-scrolling-enabled = true;
        };
      };

    };
  };

}

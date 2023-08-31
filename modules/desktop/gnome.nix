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

      # find settings with command: dconf dump /
      dconf.settings = {
        "org/gnome/shell" = {
          favorite-apps = [
            "firefox.desktop"
            "org.wezfurlong.wezterm.desktop"
            "org.gnome.Nautilus.desktop"
            "org.gnome.Settings.desktop"
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
          cursor-theme = "Adwaita";
          icon-theme = "Adwaita";
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
        "org/gnome/nautilus/preferences" = {
          default-folder-viewer = "list-view";
          search-filter-time-type = "last_modified";
          search-view = "list-view";
          show-create-link = true;
          show-delete-permanently = true;
        };
        "org/gnome/nautilus/list-view" = { default-zoom-level = "small"; };
      };

    };
  };

}

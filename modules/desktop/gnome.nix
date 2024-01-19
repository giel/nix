{ config, lib, pkgs, modulesPath, ... }:

{

  services = {
    # Enable the X11 windowing system.
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      # keyboard settings: see mixins/xserver_keyboard.. file for configuration.nix
    };
  };

  environment = {
    # extra Gnome packages
    systemPackages = with pkgs; [
      gnome.dconf-editor
      gnome.gnome-shell-extensions
      gnome.gnome-tweaks
      gnomeExtensions.appindicator
      # TODO find out how to confure
      #      gnomeExtensions.dash-to-dock
      #      gnomeExtensions.vitals
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
        "org/gnome/desktop/a11y/keyboard" = { mousekeys-enable = false; };
        "org/gnome/desktop/calendar" = { show-weekdate = true; };
        "org/gnome/desktop/input-sources" = {
          sources = [ "xkb" "us+euro" ];
          xkb-options = [ "terminate:ctrl_alt_bksp" "caps:escape" ];
        };
        "org/gnome/desktop/interface" = {
          clock-show-weekday = true;
          font-antialiasing = "grayscale";
          font-hinting = "slight";
          cursor-theme = "Adwaita";
          icon-theme = "Adwaita";
          locate-pointer = true;
        };
        "org/gnome/desktop/peripherals/touchpad" = {
          tap-to-click = true;
          two-finger-scrolling-enabled = true;
        };
        "org/gnome/desktop/wm/keybindings" = {
          move-to-workspace-1 = [ "<Shift><Super>1" ];
          move-to-workspace-2 = [ "<Shift><Super>2" ];
          move-to-workspace-3 = [ "<Shift><Super>3" ];
          move-to-workspace-4 = [ "<Shift><Super>4" ];
          switch-to-workspace-1 = [ "<Super>1" ];
          switch-to-workspace-2 = [ "<Super>2" ];
          switch-to-workspace-3 = [ "<Super>3" ];
          switch-to-workspace-4 = [ "<Super>4" ];
          switch-to-application-1 = "@as []";
          switch-to-application-2 = "@as []";
          switch-to-application-3 = "@as []";
          switch-to-application-4 = "@as []";
        };
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,maximize,close";
          resize-with-right-button = true;
          num-workspaces = 4;
        };
        "org/gnome/nautilus/list-view" = { default-zoom-level = "small"; };
        "org/gnome/nautilus/preferences" = {
          default-folder-viewer = "list-view";
          search-filter-time-type = "last_modified";
          search-view = "list-view";
          show-create-link = true;
          show-delete-permanently = true;
        };
        "org/gnome/shell" = {
          favorite-apps = [
            "brave-browser.desktop"
            "org.wezfurlong.wezterm.desktop"
            "org.gnome.Nautilus.desktop"
            "1password.desktop"
            "org.gnome.Settings.desktop"
            "virt-manager.desktop"
          ];
          disable-user-extensions = false;
          disabled-extensions = "disabled";
          enabled-extensions = [
            # TODO some extentions do not work (not loaded?)
            "caffeine@patapon.info"
            "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
            "native-window-placement@gnome-shell-extensions.gcampax.github.com"
            "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
            "appindicatorsupport@rgcjonas.gmail.com"
          ];
        };
        "org/gnome/tweaks" = { show-extensions-notice = false; };
        "org/gtk/gtk4/settings/file-chooser" = {
          show-hidden = false;
          sort-directories-first = true;
        };
        "system/locale" = { region = "nl_NL.UTF-8"; };
      };

    };
  };

}

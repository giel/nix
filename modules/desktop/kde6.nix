{ pkgs, ... }:

{
  services = {
    # Enable the X11 windowing system.
    xserver = {
      # Enable the X11/wayland windowing system.
      enable = true;
      # keyboard settings: see mixins/xserver_keyboard.. file for configuration.nix
    };
    # Enable the KDE Plasma Desktop Environment.
    desktopManager.plasma6 = { enable = true; };
    # fonts for UI (default noto-fonts)
    desktopManager.plasma6.notoPackage = pkgs.noto-fonts;
  };

  environment = {
    # extra KDE  packages
    # systemPackages = with pkgs.libsForQt5; [ packagekit-qt bismuth ];
    plasma6.excludePackages = (with pkgs; [ kdePackages.elisa kdePackages.khelpcenter kdePackages.oxygen ]);

  };

  # Enable dconf for programs that might need it
  programs.dconf.enable = true;

  # work in progress:
  #home-manager = {
  # programs.plasma = {
  #   enable = true;
  #   shortcuts = {
  #     "kwin"."Window Quick Tile Bottom" = "Meta+Down";
  #     "kwin"."Window Quick Tile Bottom Left" = "Meta + Down + Left";
  #     "kwin"."Window Quick Tile Bottom Right" = "Meta+Down+Right";
  #     "kwin"."Window Quick Tile Left" = "Meta+Left";
  #     "kwin"."Window Quick Tile Right" = "Meta+Right";
  #     "kwin"."Window Quick Tile Top" = "Meta+Up";
  #     "kwin"."Window Quick Tile Top Left" = "Meta + Up + Left";
  #     "kwin"."Window Quick Tile Top Right" = "Meta + Up + Right";
  #     "kwin"."Window to Desktop 1" = "Meta+!";
  #     "kwin"."Window to Desktop 2" = "Meta+@";
  #     "kwin"."Window to Desktop 3" = "Meta+#";
  #     "kwin"."Window to Desktop 4" = "Meta+$";
  #     "kwin"."Window to Desktop 5" = "Meta+%";
  #     "kwin"."Switch to Desktop 1" = "Meta+1";
  #     "kwin"."Switch to Desktop 2" = "Meta+2";
  #     "kwin"."Switch to Desktop 3" = "Meta+3";
  #     "kwin"."Switch to Desktop 4" = "Meta+4";
  #     "kwin"."Switch to Desktop 5" = "Meta+5";
  #     "services/org.kde.krunner.desktop"."_launch" = [ "Alt+Space" "Alt+F2" "Search" "Meta+Space" ];
  #   };
  #   configFile = {
  #     "kwinrc"."Desktops"."Number".value = 4;
  #     "kwinrc"."Desktops"."Rows".value = 1;
  #     "kwinrc"."Tiling"."padding".value = 4;
  #     "kdeglobals"."General"."BrowserApplication".value = "brave-browser.desktop";
  #     "kdeglobals"."General"."TerminalApplication".value = "wezterm start --cwd .";
  #     "kdeglobals"."General"."TerminalService".value = "org.wezfurlong.wezterm.desktop";
  #     "kxkbrc"."Layout"."Options".value = "caps:escape";
  #     "kxkbrc"."Layout"."ResetOldOptions".value = true;
  #     "plasma-localerc"."Formats"."LANG".value = "en_GB.UTF-8";
  #   };
  # };
  #};

}

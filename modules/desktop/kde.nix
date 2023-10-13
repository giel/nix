{ config, lib, pkgs, ... }:

{

  services = {
    # Enable the X11 windowing system.
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Enable the KDE Plasma Desktop Environment.
      displayManager.sddm.enable = true;
      desktopManager.plasma5 = { enable = true; };
      # Configure keymap in X11
      layout = "us";
      xkbVariant = "";
    };
  };

  environment = {
    # extra KDE  packages
    systemPackages = with pkgs.libsForQt5; [ packagekit-qt bismuth ];
    plasma5.excludePackages = (with pkgs; [ elisa khelpcenter oxygen ]);

  };

  # Enable dconf for programs that might need it
  programs.dconf.enable = true;

  # work in progress:
  #  home-manager = {

  #    programs.plasma = {
  #      enable = true;
  #      shortcuts = {
  #        "kwin"."Window Quick Tile Bottom" = "Meta+Down";
  #        "kwin"."Window Quick Tile Bottom Left" = [ ];
  #        "kwin"."Window Quick Tile Bottom Right" = "Meta+Down+Right";
  #        "kwin"."Window Quick Tile Left" = "Meta+Left";
  #        "kwin"."Window Quick Tile Right" = "Meta+Right";
  #        "kwin"."Window Quick Tile Top" = "Meta+Up";
  #        "kwin"."Window Quick Tile Top Left" = [ ];
  #        "kwin"."Window Quick Tile Top Right" = [ ];
  #        "kwin"."Window to Desktop 1" = [ ];
  #      };
  #      files = {
  #        "kwinrc"."Desktops"."Number" = 1;
  #        "kwinrc"."Desktops"."Rows" = 1;
  #        "kwinrc"."Tiling"."padding" = 4;
  #      };
  #    };

  #  };

}

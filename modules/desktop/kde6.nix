{ pkgs, ... }:

{

  services = {
    # Enable the X11 windowing system.
    xserver = {
      # Enable the X11/wayland windowing system.
      enable = true;
      # Enable the KDE Plasma Desktop Environment.
      desktopManager.plasma6 = { enable = true; };
      # fonts for UI (default noto-fonts)
      desktopManager.plasma6.notoPackage = pkgs.noto-fonts;
      # keyboard settings: see mixins/xserver_keyboard.. file for configuration.nix
    };
  };

  environment = {
    # extra KDE  packages
    # systemPackages = with pkgs.libsForQt5; [ packagekit-qt bismuth ];
    plasma6.excludePackages = (with pkgs; [ elisa khelpcenter oxygen ]);

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

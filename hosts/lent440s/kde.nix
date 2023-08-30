{ config, lib, pkgs, modulesPath, ... }:

{

  services = {
    # Enable the X11 windowing system.
    xserver = {
      # Enable the KDE Plasma Desktop Environment.
      displayManager.sddm.enable = true;
      desktopManager.plasma5 = { enable = true; };
    };
  };

  environment = {
    # extra KDE  packages
    systemPackages = with pkgs.libsForQt5; [ packagekit-qt bismuth ];
    plasma5.excludePackages = (with pkgs; [ elisa khelpcenter oxygen ]);

  };

  # Enable dconf for programs that might need it
  programs.dconf.enable = true;

}

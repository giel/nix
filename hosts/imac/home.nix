# { config, lib, pkgs, modulesPath, ... }:

{ config, pkgs, home-manager, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        # sublime4  # seems to use open-ssl 1.1 that is end of life
        # thunderbird
        alacritty
        bat
        bcompare
        bottles
        brave
        go
        gopls
        jetbrains.goland
        jetbrains.rider
        # lf  used as a test for stable packages
        meld
        python39
        remmina
        slack
        steam
        ungoogled-chromium
        unzip
        wezterm
      ];

      home.stateVersion = "23.11";
    };
  };

  programs.steam.enable = true;
}

{ config, lib, pkgs, modulesPath, ... }:

let stablePkgs = pkgs.stable;
in {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    # home.username = "giels";
    # home.homeDirectory = "/home/giels";

    # Let Home Manager install and manage itself.
    # programs.home-manager.enable = true;
    # nixpkgs.config.allowUnfree = true;

    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        alacritty
        awesome
        bat
        bcompare
        brave
        dotnet-sdk
        drawio
        fortune
        go
        inkscape-with-extensions
        jetbrains.goland
        jetbrains.rider
        libreoffice
        meld
        pcloud
        python39
        remmina
        stablePkgs.lf
        # sublime4  # seems to use open-ssl 1.1 that is end of life
        thunderbird
      ];

      home.stateVersion = "23.11";
    };
  };
}

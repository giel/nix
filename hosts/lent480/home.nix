{ config, lib, pkgs, modulesPath, ... }:

let stablePkgs = pkgs.stable;
in {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        alacritty
        awesome
        bat
        bcompare
        dotnet-sdk
        drawio
        fortune
        go
        inkscape-with-extensions
        jetbrains.goland
        jetbrains.rider
        libreoffice
        meld
        python39
        remmina
        stablePkgs.lf
        textadept
        # sublime4 # seems to use open-ssl 1.1 that is end of life; see workaround in configuration.nix
        # thunderbird
      ];

      home.stateVersion = "23.11";
    };
  };
}

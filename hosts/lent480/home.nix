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
        gcc_multi
        go
        gopls
        inkscape-with-extensions
        jetbrains.goland
        jetbrains.rider
        libreoffice
        meld
        neovim
        nodejs_20
        python39
        remmina
        ripgrep
        stablePkgs.lf
        stylua
        # sublime4  # seems to use open-ssl 1.1 that is end of life
        # thunderbird
      ];

      home.stateVersion = "23.05";
    };
  };
}

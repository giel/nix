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
        gcc_multi # for neovim
        go
        gopls
        jetbrains.goland
        jetbrains.rider
        # lf  used as a test for stable packages
        meld
        neovim
        nodejs_18 # for neovim
        python39
        remmina
        ripgrep # for neovim
        slack
        ungoogled-chromium
        unzip
        wezterm
      ];

      home.stateVersion = "23.05";
    };
  };
}

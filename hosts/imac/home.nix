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
        automake  # for neovim
        bat
        bcompare
        cmake  # for neovim
        gcc_multi # for neovim
        gnumake  # for neovim
        go
        gopls
        jetbrains.goland	
        jetbrains.rider
        # lf  used as a test for stable packages
        lua54Packages.busted  # for neovim
        lua54Packages.luarocks # for neovim
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

# { config, lib, pkgs, modulesPath, ... }:

{ config, pkgs, home-manager, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        # sublime4  # seems to use open-ssl 1.1 that is end of life
        # thunderbird
        _1password
        _1password-gui
        alacritty
        bat
        bcompare
        chezmoi
        direnv
        fd # for neovim
        firefox
        fzf
        gcc_multi # for neovim
        gitui
        go
        gopls
        jetbrains.goland
        jetbrains.rider
        lazygit
        # lf  used as a test for stable packages
        lsd
        marksman # for neovim
        meld
        neovim
        nodejs_18 # for neovim
        openvpn
        python39
        remmina
        ripgrep # for neovim
        slack
        starship
        stylua
        ungoogled-chromium
        unzip
        wezterm
        zsh
      ];

      home.stateVersion = "23.05";
    };
  };
}

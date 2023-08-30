{ config, lib, pkgs, modulesPath, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        _1password
        _1password-gui
        alacritty
        awesome
        bat
        chezmoi
        dotnet-sdk
        fd
        firefox
        fortune
        fzf
        gcc_multi
        gitui
        go
        gopls
        jetbrains.goland
        jetbrains.rider
        lazygit
        lf
        lsd
        meld
        neovim
        nodejs_20
        openvpn
        python39
        remmina
        ripgrep
        starship
        stylua
        ungoogled-chromium
        unzip
        vscodium
        wezterm
        zsh
        # bcompare  # gives a sha2 error
        # sublime4  # seems to use open-ssl 1.1 that is end of life
        # thunderbird
      ];

      home.stateVersion = "23.05";
    };
  };
}

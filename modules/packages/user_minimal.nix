{ config, lib, pkgs, modulesPath, ... }:

{
  home-manager = {
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        _1password
        _1password-gui
        chezmoi
        direnv
        fd
        firefox
        fzf
        gitui
        lazygit
        # unstable.lazygit
        lf
        lsd
        marksman
        openvpn
        starship
        ungoogled-chromium
        unzip
        wezterm
        zsh
      ];

    };
  };
}


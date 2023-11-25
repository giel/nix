{ config, lib, pkgs, modulesPath, ... }:

{
  home-manager = {
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        _1password
        _1password-gui
        brave
        chezmoi
        direnv
        fd
        firefox
        fortune
        fzf
        gitui
        lazygit
        lsd
        marksman
        openvpn
        starship
        ungoogled-chromium
        unzip
        wezterm
      ];

    };
  };
}


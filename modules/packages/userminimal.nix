{ config, lib, pkgs, modulesPath, ... }:

{
  home-manager = {
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        _1password
        _1password-gui
        chezmoi
        fd
        firefox
        fzf
        gitui
        lazygit
        lf
        lsd
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

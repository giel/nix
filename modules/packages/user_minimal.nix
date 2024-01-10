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
        kitty
        lazygit
        lsd
        marksman
        openfortivpn
        starship
        ungoogled-chromium
        unzip
        wezterm
      ];

    };
  };

  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
  };

}


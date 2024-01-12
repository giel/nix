{ config, lib, pkgs, modulesPath, ... }:
{

  home-manager = {
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        _1password
        _1password-gui
        alacritty
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
        lf
        starship
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

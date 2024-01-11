{ config, lib, pkgs, modulesPath, ... }:

let pkgsStable = pkgs.stable;
in
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
        pkgsStable.lf
        starship
        unzip
        wezterm
      ];

    };
  };
}


{ pkgs, pkgs-stable, pkgs-2305, userSettings, ... }: {

  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        _1password
        _1password-gui
        alacritty
        brave
        chezmoi
        direnv
        exiftool
        fd
        firefox
        fortune
        fzf
        gitui
        kitty
        lazygit
        lsd
        marksman
        # lf can used for testing with different versions
        # lf
        # pkgs-stable.lf
        pkgs-2305.lf
        starship
        yazi
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

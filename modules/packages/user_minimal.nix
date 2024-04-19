{ pkgs, pkgs-stable, pkgs-2305, userSettings, ... }: {

  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        chezmoi
        direnv
        fd
        fortune
        fzf
        gat
        gitui
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
      ];
    };
  };

  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
    fzf.keybindings = true;
    fzf.fuzzyCompletion = true;
  };

}

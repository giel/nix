{ pkgs, pkgs-stable, userSettings, ... }: {

  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        bat
        chezmoi
        delta
        direnv
        fd
        fortune
        fzf
        gat
        gitui
        lazygit
        lsd
        marksman
        starship
        yazi
        unzip
        zoxide
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

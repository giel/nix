{ pkgs, pkgs-stable, pkgs-2305, userSettings, ... }: {

  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        _1password
        _1password-gui
        alacritty
        brave
        exiftool
        # lf can used for testing with different versions
        # lf
        # pkgs-stable.lf
        pkgs-2305.lf
        wezterm
      ];
    };
  };

}

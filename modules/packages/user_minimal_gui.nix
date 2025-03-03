{ pkgs, pkgs-stable, pkgs-2305, userSettings, ... }: {

  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        _1password-cli
        _1password-gui
        alacritty
        bcompare
        # pkgs-stable.bcompare
        brave
        exiftool
        # obsidian todo find out what goes wrong
        # lf can used for testing with different versions
        # lf
        # pkgs-stable.lf
        ghostty
        pkgs-2305.lf
        warp-terminal
        wezterm
        zed-editor
      ];
    };
  };

}

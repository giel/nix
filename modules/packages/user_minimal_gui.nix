{ pkgs, pkgs-stable, userSettings, ... }: {

  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        _1password-cli
        _1password-gui
        alacritty
        bcompare
        brave
        exiftool
        # obsidian todo find out what goes wrong
        ghostty
        warp-terminal
        wezterm
        zed-editor
      ];
    };
  };

}

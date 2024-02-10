{ userSettings, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        # sublime4  # seems to use open-ssl 1.1 that is end of life
        # thunderbird
        alacritty
        bat
        bcompare
        bottles
        meld
        python39
        steam
      ];

      home.stateVersion = userSettings.version;
    };
  };

  programs.steam.enable = true;
}

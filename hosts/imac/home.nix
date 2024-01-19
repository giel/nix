{ ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.giels = { pkgs, ... }: {
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

      home.stateVersion = "23.11";
    };
  };

  programs.steam.enable = true;
}

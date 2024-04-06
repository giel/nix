{ userSettings, ... }: {
  # { userSettings, plasma-manager, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        # sublime4  # seems to use open-ssl 1.1 that is end of life
        # thunderbird
        alacritty
        bat
      ];

      home.stateVersion = userSettings.version;
      # sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
    };
  };

}

{ userSettings, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        python39
      ];

      home.stateVersion = userSettings.version;
    };
  };
}

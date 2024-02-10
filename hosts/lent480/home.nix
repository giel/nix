{ userSettings, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        bat
        drawio
        inkscape-with-extensions
        libreoffice
        python39
        textadept
        # sublime4 # seems to use open-ssl 1.1 that is end of life; see workaround in configuration.nix
        # thunderbird
      ];

      home.stateVersion = userSettings.version;
    };
  };
}

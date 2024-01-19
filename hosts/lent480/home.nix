{ ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        awesome
        bat
        bcompare
        drawio
        inkscape-with-extensions
        libreoffice
        meld
        python39
        textadept
        # sublime4 # seems to use open-ssl 1.1 that is end of life; see workaround in configuration.nix
        # thunderbird
      ];

      home.stateVersion = "23.11";
    };
  };
}

{ userSettings, ... }:

{
  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        azure-cli
      ];
    };
  };
}

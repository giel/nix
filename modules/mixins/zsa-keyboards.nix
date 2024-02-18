{ userSettings, ... }:

{
  hardware.keyboard.zsa.enable = true;
  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        wally-cli
      ];
    };
  };
}

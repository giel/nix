{ userSettings, ... }:

{
  hardware.keyboard.qmk.enable = true;

  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        qmk
        vial
      ];
    };
  };
}

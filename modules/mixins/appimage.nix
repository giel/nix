{ userSettings, pkgs, ... }:

{
  boot.kernelModules = [ "fuse" ];
  users.users.${userSettings.user}.extraGroups = [ "fuse" ];
  environment.systemPackages = with pkgs; [ fuse ];

  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        appimage-run
      ];
    };
  };
}

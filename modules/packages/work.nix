{ config, lib, pkgs, modulesPath, ... }:

{
  home-manager = {
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        openfortivpn
        slack
        remmina
      ];

    };
  };
}
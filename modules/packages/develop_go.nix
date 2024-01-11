{ config, lib, pkgs, modulesPath, ... }:

{
  home-manager = {
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        bcompare
        go
        jetbrains.goland
        meld
      ];
    };
  };
}

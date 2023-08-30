{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    bluez
    curl
    file
    git
    git-lfs
    neofetch
    vim
    wget
    xclip
    zsh
  ];

  programs.zsh.enable = true;
}

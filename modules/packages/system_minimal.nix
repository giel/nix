{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    bluez
    curl
    file
    git
    git-lfs
    neofetch
    nixfmt
    vim
    wget
    xclip
    zsh
  ];

  programs.zsh.enable = true;
}

{ pkgs, pkgs-stable, ... }:

{

  environment.systemPackages = with pkgs; [
    bluez
    curl
    fastfetch
    file
    git
    git-lfs
    neofetch
    nixfmt
    tmux
    vim
    wget
    xclip
    zsh
    pkgs-stable.xz
  ];

  programs.zsh.enable = true;
}

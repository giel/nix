{ pkgs, ... }:

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
  ];

  programs.zsh.enable = true;
}

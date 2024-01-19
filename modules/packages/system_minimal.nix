{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    bluez
    curl
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

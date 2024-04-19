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
    nh
    nix-output-monitor
    nixfmt
    nvd
    tmux
    vim
    wget
    xclip
    zsh
  ];

  programs.zsh.enable = true;
}

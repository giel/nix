{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bluez
    curl
    fastfetch
    file
    git
    git-lfs
    nh
    nix-output-monitor
    nixfmt-classic
    nvd
    tmux
    vim
    wget
    xclip
    zsh
  ];

  programs.zsh.enable = true;
}

{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    automake
    cmake
    gcc_multi
    gnumake
    gopls
    lua54Packages.busted
    lua54Packages.luarocks
    lua-language-server
    marksman
    neovim
    nodejs_18
    ripgrep
    stylua
    yaml-language-server
  ];

}

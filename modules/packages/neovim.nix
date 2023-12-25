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
    lua-language-server # maybe ot needed if using nix-ld as done below
    marksman
    neovim
    nodejs_18
    ripgrep
    stylua
    yaml-language-server
  ];

  # https://nix.dev/guides/faq#how-to-run-non-nix-executables
  # Enable dynamic linking for LSP's with Mason as Mason download executables
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];
}

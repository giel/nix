{ pkgs, pkgs-2411, ... }:

{
  environment.systemPackages = with pkgs; [
    automake
    cargo # needed for nil (nix language server)
    cmake
    gcc_multi
    gnumake
    go
    gopls
    lua54Packages.busted
    lua54Packages.luarocks
    lua-language-server # maybe not needed if using nix-ld as done below
    marksman
    pkgs-2411.neovim
    nodejs_18
    python3
    ripgrep
    rustup
    stylua
    yaml-language-server
  ];

  # https://nix.dev/guides/faq#how-to-run-non-nix-executables
  # Enable dynamic linking for LSP's with Mason as Mason download executables
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs;
    [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
    ];
}

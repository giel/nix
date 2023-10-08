{
  description = "flake for im4014";

  inputs = {
    # Current stable Nix Packages
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    # Unstable Nix Packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # User Package Management
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, home-manager, ... }: {
    nixosConfigurations = {
      im4014 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          [ ./configuration.nix home-manager.nixosModules.home-manager ];
      };
    };
  };
}

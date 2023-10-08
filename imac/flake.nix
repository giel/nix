{
  description = "flake for im4014";

  inputs = {
    # Current stable Nix Packages
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    # Unstable Nix Packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-stable }: {
    nixosConfigurations = {
      im4014 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };
    };
  };
}

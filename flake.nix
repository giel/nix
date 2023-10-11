{
  description = "Giel's NixOS configuration";

  # All flake references used to build my NixOS setup. These are dependencies.
  inputs = {
    # Default Current stable Nix Packages
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    # Unstable Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    # User Package Management
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    utils = { url = "github:gytis-ivaskevicius/flake-utils-plus"; };

    # KDE Plasma user settings
    plasma-manager = {
      # Add "inputs.plasma-manager.homeManagerModules.plasma-manager" to the home-manager.users.${user}.imports
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "nixpkgs";
    };
  };

  outputs = { self, home-manager, nixpkgs, nixpkgs-stable, nixos-hardware
    , utils, plasma-manager, ... }@inputs: {
      nixosModules = import ./modules { lib = nixpkgs.lib; };
      nixosConfigurations = {
        im4014 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            {
              nixpkgs.overlays = [
                (import ./hosts/imac/stable-overlay.nix {
                  nixpkgsStableSrc = nixpkgs-stable;
                })
              ];
            }
            ./hosts/imac/configuration.nix
            home-manager.nixosModules.home-manager
          ];
        };
        lent440s = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/lent440s/configuration.nix
            utils.nixosModules.autoGenFromInputs
            home-manager.nixosModules.home-manager
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
            nixos-hardware.nixosModules.common-cpu-intel-kaby-lake
            nixos-hardware.nixosModules.common-gpu-intel
          ];
          specialArgs = { inherit inputs; };
        };
        lent480 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/lent480/configuration.nix
            utils.nixosModules.autoGenFromInputs
            home-manager.nixosModules.home-manager
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
            nixos-hardware.nixosModules.common-cpu-intel-kaby-lake
            nixos-hardware.nixosModules.common-gpu-intel
          ];
          specialArgs = { inherit inputs; };
        };
        lenx1ext = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/lenx1ext/configuration.nix
            utils.nixosModules.autoGenFromInputs
            home-manager.nixosModules.home-manager
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
            nixos-hardware.nixosModules.common-cpu-intel-kaby-lake
            nixos-hardware.nixosModules.common-gpu-intel
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}

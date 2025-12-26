{
  description = "Giel's NixOS configuration";

  # All flake references used to build my NixOS setup. These are dependencies.
  inputs = {
    # Unstable Nix Packages - the packages we use by default
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Default Current stable Nix Packages
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    # Older branch to use in other cases
    nixpkgs-2505.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-2511.url = "github:nixos/nixpkgs/nixos-25.11";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    ghostty.url = "github:ghostty-org/ghostty";

    # User Package Management
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    utils = { url = "github:gytis-ivaskevicius/flake-utils-plus/v1.4.0"; };

    # KDE Plasma user settings
    plasma-manager = {
      # Add "inputs.plasma-manager.homeManagerModules.plasma-manager" to the home-manager.users.${user}.imports
      # url = "github:pjones/plasma-manager";
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-stable
    , nixpkgs-2505
    , nixpkgs-2511
    , nixos-hardware
    , home-manager
    , utils
    , plasma-manager
    , ghostty
    , ...
    }@inputs:
    let
      system = "x86_64-linux";
      userSettings = {
        user = "giels";
        userName = "Giel Scharff";
        timeZone = "Europe/Amsterdam";
        version = "23.11";
      };
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        pkgs-2505 = import nixpkgs-2505 {
          inherit system;
          config.allowUnfree = true;
        };
        pkgs-2511 = import nixpkgs-2511 {
          inherit system;
          config.allowUnfree = true;
        };
        inherit nixos-hardware;
        inherit system;
        inherit inputs;
        inherit userSettings;
      };
    in
    {
      # enable nix fmt command:
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

      nixosModules = import ./modules { lib = nixpkgs.lib; };
      nixosConfigurations = {
        fw1625lin = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./hosts/fw1625lin/configuration.nix
            utils.nixosModules.autoGenFromInputs
            home-manager.nixosModules.home-manager
          ];
        };
        im4014 = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./hosts/imac/configuration.nix
            home-manager.nixosModules.home-manager
          ];
        };
        lent480 = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./hosts/lent480/configuration.nix
            utils.nixosModules.autoGenFromInputs
            home-manager.nixosModules.home-manager
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
            { environment.systemPackages = [ ghostty.packages.x86_64-linux.default ]; }
            # nixos-hardware.nixosModules.common-cpu-intel-kaby-lake
            # 9-5-2024 temporarily disabled because of compile error
            # nixos-hardware.nixosModules.common-gpu-intel
          ];
        };
        lenx1ext = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./hosts/lenx1ext/configuration.nix
            utils.nixosModules.autoGenFromInputs
            home-manager.nixosModules.home-manager
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
            { environment.systemPackages = [ ghostty.packages.x86_64-linux.default ]; }
            # nixos-hardware.nixosModules.common-cpu-intel-kaby-lake
            # 9-5-2024 temporarily disabled because of compile error
            # nixos-hardware.nixosModules.common-gpu-intel
          ];
        };
        mf9-7940hs = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./hosts/mf9-7940hs/configuration.nix
            home-manager.nixosModules.home-manager
          ];
        };
        vmnix01 = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./hosts/vmnix01/configuration.nix
            utils.nixosModules.autoGenFromInputs
            home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}

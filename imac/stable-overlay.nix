# This file defines overlays and IS used

{ nixpkgsStableSrc }:
# When applied, the stable nixpkgs set (declared in the flake inputs) will
# be accessible through 'pkgs.stable'
final: prev: {
  stable = import nixpkgsStableSrc {
    system = final.system;
    config.allowUnfree = true;
  };
}


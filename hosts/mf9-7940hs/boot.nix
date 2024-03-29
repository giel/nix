# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-2ef177b6-3ce5-4544-847f-249a27643dea".device = "/dev/disk/by-uuid/2ef177b6-3ce5-4544-847f-249a27643dea";
}

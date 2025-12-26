{ ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-96e98e38-b1ce-40d5-a50a-ab7c2b55b382".device = "/dev/disk/by-uuid/96e98e38-b1ce-40d5-a50a-ab7c2b55b382";
}

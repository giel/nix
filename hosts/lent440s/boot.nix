{ config, lib, pkgs, modulesPath, ... }:

{
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Setup keyfile
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

  # Enable grub cryptodisk
  boot.loader.grub.enableCryptodisk = true;

  boot.initrd.luks.devices."luks-028bfe7d-210f-46e6-a5cb-ffeeba768a42".keyFile =
    "/crypto_keyfile.bin";
  # Enable swap on luks
  boot.initrd.luks.devices."luks-e1bc38e7-b4f0-44f7-9789-88087da29e15".device =
    "/dev/disk/by-uuid/e1bc38e7-b4f0-44f7-9789-88087da29e15";
  boot.initrd.luks.devices."luks-e1bc38e7-b4f0-44f7-9789-88087da29e15".keyFile =
    "/crypto_keyfile.bin";

}

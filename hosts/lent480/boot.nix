{ ... }:

{

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-db380faf-79b0-41e4-b70f-3314ef8469d0".device =
    "/dev/disk/by-uuid/db380faf-79b0-41e4-b70f-3314ef8469d0";
  boot.initrd.luks.devices."luks-db380faf-79b0-41e4-b70f-3314ef8469d0".keyFile =
    "/crypto_keyfile.bin";

}

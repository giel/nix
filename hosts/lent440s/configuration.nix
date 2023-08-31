{ config, pkgs, inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix
    ./home.nix
    mixins-soundpipewire
    mixins-xserver_keyboard_touchpad
    packages-systemminimal
    packages-userminimal
    # choose desktop: xfce, kde or gnome
    # desktop-gnome
    # desktop-kde
    # desktop-xfce
    desktop-xfce
    mixins-openssh
  ];

  # enable some experimental features
  # https://nixos.org/manual/nix/stable/command-ref/conf-file#conf-experimental-features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.giels = {
    isNormalUser = true;
    description = "Giel Scharff";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  nix = {
    # From flake-utils-plus
    generateNixPathFromInputs = true;
    generateRegistryFromInputs = true;
    linkInputs = true;
  };

  networking = {
    hostName = "lent440s";
    networkmanager.enable = true;
  };

  services = { thermald.enable = true; };

  # Specific for xfce as it does not provide its own bluetooth manager
  environment.systemPackages = with pkgs; [ blueman ];

  console = {
    font = "Lat2-Terminus16";
    # font = "Lat2-Terminus22";
    keyMap = "us";
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };
  time.timeZone = "Europe/Amsterdam";

  hardware = {
    opengl.enable = true;
    trackpoint = {
      enable = true;
      sensitivity = 255;
    };
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.05";
}


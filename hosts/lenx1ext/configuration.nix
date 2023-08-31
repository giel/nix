{ config, pkgs, inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix
    ./boot.nix
    ./home.nix
    mixins-xserver_keyboard_touchpad
    mixins-sound_pipewire
    packages-system_minimal
    packages-user_minimal
    # choose desktop: xfce, kde or gnome
    # desktop-gnome
    # desktop-kde
    # desktop-xfce
    # desktop-budgie
    desktop-budgie
    mixins-openssh
  ];
  # enable some experimental features
  # https://nixos.org/manual/nix/stable/command-ref/conf-file#conf-experimental-features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
    hostName = "lenx1ext";
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

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

  services = {
    thermald.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # font Jetbrains does not seem to work with Alacritty
  # Also sometimes a warning is issued to remove a file manually 
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      font-awesome
      inconsolata-nerdfont
      jetbrains-mono
      source-code-pro
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  system.stateVersion = "23.05"; # Did you read the comment?

}

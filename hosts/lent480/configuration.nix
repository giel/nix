{ config, pkgs, inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix
    ./boot.nix
    ./home.nix

    ../../modules/mixins/openssh.nix
    ../../modules/mixins/sound_pipewire.nix
    ../../modules/mixins/xserver_keyboard_touchpad.nix

    ../../modules/packages/system_minimal.nix
    ../../modules/packages/user_minimal.nix
    ../../modules/packages/vm.nix
    ../../modules/packages/neovim.nix

    # choose desktop: see ../../modules/desktop/ 
    ../../modules/desktop/gnome.nix
    # desktop-kde
    # desktop-hyprland
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

  environment.systemPackages = [
    pkgs.cpufetch
    #   unstable-pkgs.cpufetch
  ];

  networking = {
    hostName = "lent480";
    networkmanager.enable = true;
  };

  services = {
    thermald.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;
  };

  console = {
    font = "Lat2-Terminus16";
    # font = "Lat2-Terminus22";
    keyMap = "us";
  };

  # font Jetbrains does not seem to work with Alacritty
  # Also sometimes a warning is issued to remove a file manually 
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      font-awesome
      inconsolata-nerdfont
      jetbrains-mono
      source-code-pro
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];
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

  # only needed for sublime4:
  # nixpkgs.config.permittedInsecurePackages = [ "openssl-1.1.1w" ];

  system.stateVersion = "23.11";
}


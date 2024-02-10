{ pkgs, lib, userSettings, ... }: {

  options = {
    my.desktopKDE.option = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./home.nix
      ../../modules/mixins/openssh.nix
      ../../modules/packages/system_minimal.nix
      ../../modules/packages/user_minimal.nix
      ../../modules/packages/neovim.nix
    ];

  config = {
    # enable some experimental features
    # https://nixos.org/manual/nix/stable/command-ref/conf-file#conf-experimental-features
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nix = {
      # From flake-utils-plus
      generateNixPathFromInputs = true;
      generateRegistryFromInputs = true;
      linkInputs = true;
    };

    networking.hostName = "vmnix01"; # Define your hostname.
    # Enable networking
    networking.networkmanager.enable = true;

    environment.systemPackages = [
      pkgs.cpufetch
    ];

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${userSettings.user} = {
      isNormalUser = true;
      description = userSettings.userName;
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.zsh;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    system.stateVersion = userSettings.version;

    # Bootloader.
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/vda";
    boot.loader.grub.useOSProber = true;


    # Set your time zone.
    time.timeZone = userSettings.timeZone;

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

    # Configure keymap in X11
    services.xserver = {
      layout = "us";
      xkbVariant = "";
    };



  };


}

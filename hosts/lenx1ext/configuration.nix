{ config, pkgs, inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix
    ./home.nix
    mixins-soundpipewire
    packages-systemminimal
    packages-userminimal
    # choose desktop: xfce, kde or gnome
    # desktop-gnome
    # desktop-kde
    # desktop-xfce
    desktop-gnome
    mixins-openssh
  ];
  # enable some experimental features
  # https://nixos.org/manual/nix/stable/command-ref/conf-file#conf-experimental-features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

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
    #    tlp = {
    #      enable = true;
    #      settings = {
    #        PCIE_ASPM_ON_BAT = "powersupersave";
    #        CPU_SCALING_GOVERNOR_ON_AC = "performance";
    #        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    #        CPU_MAX_PERF_ON_AC = "100";
    #        CPU_MAX_PERF_ON_BAT = "30";
    #        STOP_CHARGE_THRESH_BAT1 = "95";
    #        STOP_CHARGE_THRESH_BAT0 = "95";
    #      };
    #    };

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      # Configure keymap in X11
      layout = "us";
      xkbVariant = "euro";
    };

  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  console = {
    font = "Lat2-Terminus16";
    # font = "Lat2-Terminus22";
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

  #  # Enable sound with pipewire.
  #  sound.enable = true;
  #  hardware.pulseaudio.enable = false;
  #  security.rtkit.enable = true;
  #  services.pipewire = {
  #    enable = true;
  #    alsa.enable = true;
  #    alsa.support32Bit = true;
  #    pulse.enable = true;
  #    # If you want to use JACK applications, uncomment this
  #    #jack.enable = true;
  #
  #    # use the example session manager (no others are packaged yet so this is enabled by default,
  #    # no need to redefine it in your config for now)
  #    #media-session.enable = true;
  #  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "23.05"; # Did you read the comment?

}

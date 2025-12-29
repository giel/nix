{ pkgs, userSettings, ... }: {
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./boot.nix
      ./home.nix

      ../../modules/mixins/openssh.nix
      ../../modules/mixins/sound_pipewire.nix

      ../../modules/packages/system_minimal.nix
      ../../modules/packages/user_minimal.nix
      ../../modules/packages/user_minimal_gui.nix
      ../../modules/packages/neovim.nix

      ../../modules/packages/develop.nix
      ../../modules/packages/develop_go.nix
      ../../modules/packages/develop_csharp.nix
      ../../modules/packages/netbird.nix
      # ../../modules/packages/vm.nix
      #   ../../modules/packages/vm_incus.nix

      # ../../modules/packages/work.nix

      # choose desktop set with KDE:
      # ../../modules/desktop/kde.nix
      ../../modules/desktop/kde6.nix
      # ../../modules/desktop/i3_xfce.nix
      # ../../modules/desktop/xfce.nix
      ../../modules/desktop/hyprland.nix

      # or choose desktop set with GNOME or Budgie:
      # ../../modules/desktop/budgie.nix
      # ../../modules/desktop/gnome.nix

      # Login manager enables start of desktops above via login menu.
      # Also changes to GDM or SSDM for GNOME or KDE in the login_manager:
      ../../modules/desktop/login_manager.nix
    ];

  config = {
    # Enable Flakes and the new command-line tool
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nix = {
      # From flake-utils-plus
      generateNixPathFromInputs = true;
      generateRegistryFromInputs = true;
      linkInputs = true;
    };

    networking =
      {
        hostName = "fw1625lin"; # Define your hostname.
        # Enable networking
        networkmanager.enable = true;
      };

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

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # enable bluetooth
    hardware.bluetooth.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${userSettings.user} = {
      isNormalUser = true;
      description = userSettings.userName;
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.zsh;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
    ];

    # font Jetbrains does not seem to work with Alacritty
    # Also sometimes a warning is issued to remove a file manually
    fonts = {
      fontDir.enable = true;
      packages = with pkgs; [
        font-awesome
        jetbrains-mono
        nerd-fonts.fira-code
        nerd-fonts.inconsolata
        nerd-fonts.jetbrains-mono
        source-code-pro
      ];
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.11"; # Did you read the comment?

  };
}

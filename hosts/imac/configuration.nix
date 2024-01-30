# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, userSettings, ... }: {

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./boot.nix
    ./home.nix

    ../../modules/mixins/openssh.nix
    ../../modules/mixins/sound_pipewire.nix
    ../../modules/mixins/graphics-tools.nix

    ../../modules/packages/system_minimal.nix
    ../../modules/packages/user_minimal.nix
    ../../modules/packages/neovim.nix

    ../../modules/packages/develop_go.nix
    ../../modules/packages/develop_csharp.nix

    ../../modules/packages/work.nix

    # choose desktop set with KDE:
    #  ../../modules/desktop/kde.nix
    #  ../../modules/desktop/hyprland.nix
    #  ../../modules/desktop/i3_xfce.nix
    #  ../../modules/desktop/xfce.nix
    ../../modules/desktop/hyprland.nix

    # or choose desktop set with GNOME or Budgie:
    # ../../modules/desktop/budgie.nix
    ../../modules/desktop/gnome.nix

    # Login manager enables start of desktops above via login menu.
    # Also changes to GDM or SSDM for GNOME or KDE in the login_manager:
    ../../modules/desktop/login_manager.nix
  ];

  # enable some experimental features
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # graphic: AMD Radeon™ R9 200 Series
  # code below is only needed for newer AMD cards
  #  boot.initrd.kernelModules = [ "amdgpu" ];
  #  services.xserver.enable = true;
  #  services.xserver.videoDrivers = [ "amdgpu" ];

  # networking
  networking = {
    hostName = "im4014";
    networkmanager.enable = true;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  };

  # Enable bluetooth
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

  system.stateVersion = "23.11"; # Did you read the comment?

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

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

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

}

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, userSettings, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./boot.nix
      ./home.nix

      ../../modules/mixins/openssh.nix
      ../../modules/mixins/sound_pipewire.nix
      ../../modules/mixins/graphics-tools.nix
      ../../modules/mixins/zsa-keyboards.nix

      ../../modules/packages/system_minimal.nix
      ../../modules/packages/user_minimal.nix
      ../../modules/packages/user_minimal_gui.nix
      ../../modules/packages/neovim.nix

      ../../modules/packages/develop.nix
      ../../modules/packages/develop_go.nix
      ../../modules/packages/develop_csharp.nix
      ../../modules/packages/develop_cloud.nix

      # choose desktop set with KDE:
      # ../../modules/desktop/kde.nix
      ../../modules/desktop/kde6.nix
      #  ../../modules/desktop/hyprland.nix
      #  ../../modules/desktop/i3_xfce.nix
      #  ../../modules/desktop/xfce.nix
      ../../modules/desktop/hyprland.nix

      # or choose desktop set with GNOME or Budgie:
      # ../../modules/desktop/budgie.nix
      # ../../modules/desktop/gnome.nix

      # Login manager enables start of desktops above via login menu.
      # Also changes to GDM or SSDM for GNOME or KDE in the login_manager:
      ../../modules/desktop/login_manager.nix
    ];

  # Enable Flakes and the new command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # networking
  networking = {
    hostName = "mf9-7940hs";
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

  system.stateVersion = userSettings.version;

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

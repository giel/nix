{ pkgs, userSettings, ... }:

{

  # Incus is a next generation system container and virtual machine manager.
  # https://linuxcontainers.org/incus

  # Add user to incus-admin group
  users.users.${userSettings.user}.extraGroups = [ "incus-admin" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    incus
    qemu_full # to support vm in incus, buts still does not work
  ];

  # Manage the virtualisation services
  virtualisation = {
    incus = {
      enable = true;
    };
  };
  # if you want NixOS initialize Incus (instead of `incus admin init`):
  virtualisation.incus.preseed = { };

  # Incus on NixOS is unsupported using iptables. Set `networking.nftables.enable = true;`
  networking.nftables.enable = true;

}

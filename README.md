# Nix

A repository to contain all my nix stuff. For now only NixOS related.
 
# NixOS
Add all channels. We are going to use home-manager as a module, so add like this:

        sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager

Show result:

        sudo nix-channel --list
        home-manager https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz
        nixos https://nixos.org/channels/nixos-23.05
        nixos-unstable https://channels.nixos.org/nixos-unstable

A first `flake.nix` is generated, filled from several examples and only in use on Lenovo T480 for now.


# NixOS / Nix commands


### sample commands

usually with `sudo`:

     nixos-rebuild build
     nixos-rebuild test
     nixos-rebuild switch
     nixos-rebuild switch --rollback

     nix-channel --update

normal commands

     nix-store --garbage-collect
     nix-store --optimize

flake commands

     sudo nixos-rebuild switch --flake <config path>#<host>
     sudo nixos-rebuild switch --flake .#lent480
     sudo nixos-rebuild switch --flake ~/github/dotfiles-lent480/#lent480

see `.sh` scripts for easy use.

### scripts

The folder `nixos` contains the flake config. This is the more advanced version of the folder `nixos_flakeless`

The batchfiles in the directory can be used to easily **build**, **test**, **switch** the configurastion for the `lent480`.
With **update** you can update the channels.


# links

- [Nix main site](https://nixos.org/)
- [NixOS Wiki](https://nixos.wiki)
- [Mathew Croughan nixcfg](https://github.com/MatthewCroughan/nixcfg)
- [Matthias Benaets nixos-config](https://github.com/MatthiasBenaets/nixos-config/)
- [Nix starter configs](https://github.com/Misterio77/nix-starter-configs)
- [NixOS Gnome settings and keyboard shortcuts)](https://the-empire.systems/nixos-gnome-settings-and-keyboard-shortcuts)

# hardware
### dotfiles-lent480

                  ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖            giels@lent480 
                  ▜███▙       ▜███▙  ▟███▛            ------------- 
                   ▜███▙       ▜███▙▟███▛             OS: NixOS 23.05.2975.a16f7eb56e88 (Stoat) x86_64 
                    ▜███▙       ▜██████▛              Host: LENOVO 20L6S01Q3U 
             ▟█████████████████▙ ▜████▛     ▟▙        Kernel: 6.1.46 
            ▟███████████████████▙ ▜███▙    ▟██▙       Uptime: 1 hour, 8 mins 
                   ▄▄▄▄▖           ▜███▙  ▟███▛       Packages: 981 (nix-system), 591 (nix-user) 
                  ▟███▛             ▜██▛ ▟███▛        Shell: bash 5.2.15 
                 ▟███▛               ▜▛ ▟███▛         Resolution: 1920x1080 
        ▟███████████▛                  ▟██████████▙   DE: GNOME 44.2 (Wayland) 
        ▜██████████▛                  ▟███████████▛   WM: Mutter 
              ▟███▛ ▟▙               ▟███▛            WM Theme: Adwaita 
             ▟███▛ ▟██▙             ▟███▛             Theme: Adwaita [GTK2/3] 
            ▟███▛  ▜███▙           ▝▀▀▀▀              Icons: Adwaita [GTK2/3] 
            ▜██▛    ▜███▙ ▜██████████████████▛        Terminal: kgx 
             ▜▛     ▟████▙ ▜████████████████▛         CPU: Intel i5-8350U (8) @ 3.600GHz 
                   ▟██████▙       ▜███▙               GPU: Intel UHD Graphics 620 
                  ▟███▛▜███▙       ▜███▙              Memory: 2641MiB / 15751MiB 
                 ▟███▛  ▜███▙       ▜███▙
                 ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘                                     

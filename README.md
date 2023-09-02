# Nix

A repository to contain all my nix stuff. For now only NixOS related.
 
# NixOS
Add all channels. We are going to use home-manager as a module, so add like this:

        sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
        sudo nix-channel --add https://channels.nixos.org/nixos-unstable nixos-unstable
        sudo nix-channel --add https://nixos.org/channels/nixos-23.05 nixos

Show result:

        sudo nix-channel --list
        home-manager https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz
        nixos https://nixos.org/channels/nixos-23.05
        nixos-unstable https://channels.nixos.org/nixos-unstable

A first `flake.nix` is generated, and filled from several examples (see links below). Now I have it in use for my Lenovo Thinkpads.


# NixOS / Nix commands

### sample commands

usually with `sudo`:

     nixos-rebuild build
     nixos-rebuild test
     nixos-rebuild switch
     nixos-rebuild switch --rollback

     nix-channel --update

normal commands

     nix-store --gc         # garbage-collect
     nix-store --optimize   # 

flake commands

     sudo nixos-rebuild switch --flake <config path>#<host>
     sudo nixos-rebuild switch --flake .#lent480
     sudo nixos-rebuild switch --flake ~/github/dotfiles-lent480/#lent480

**see `.sh` scripts for easy use.**

### scripts

The batchfiles in the directory can be used to easily **build**, **test**, **switch** the configurastion for the nachine you are logged on.

With **update** you can update the channels.


### setup

The `flake.nix` file contains the entry point for all NixOS configurations.
See `nixosConfigurations` array for the machines configured. Each machine configured has a corresponding folder in the `hosts` folder. The computer folder (like *lent480*) contains `.nix` files specific for this computer.

The `modules` folder contains generic code used in the machine configurations.

To **add a module**:

- create new category if needed (like *desktop*)
- add `mymodule.nix`
- add new files to git (**important**)
- refer to the module in an import like `desktop-mymodule`. Not that the `-` is used instead of a path separator.
- use `./fmt.sh` to format all nix files

To **add a machine**:

- add en new entry in `flake.nix` in the `nixosConfigurations`.
- create a new folder in `hosts` named after the machine named
- copy initial `configuration.nix` and `hardware-configuration.nix` into this folder
- make sure the configuration in the flake points to the new `configuration.nix`
- add new files to git, else you may get errors (**important**, the scripts now also check this and issue a warning)
- notice that the `imports` is done with nixosModules
- choose a desktop from the [modules/desktop](./modules/desktop)
- `./build.sh` to check the syntax and see if it can build
- `./test.sh` to build and test the configuration. New applications are available after a successful test.
- use `./fmt.sh` to format all nix files
- `./switch.sh` to activate a new configuration. This will be the default in the startup of the machine.


# links

- [Nix main site](https://nixos.org/)
- [NixOS Wiki](https://nixos.wiki)
- [Mathew Croughan nixcfg](https://github.com/MatthewCroughan/nixcfg)
- [Matthias Benaets nixos-config](https://github.com/MatthiasBenaets/nixos-config/)
- [Nix starter configs](https://github.com/Misterio77/nix-starter-configs)
- [NixOS Gnome setting tutorial](https://hoverbear.org/blog/declarative-gnome-configuration-in-nixos/)
- [NixOS Gnome settings and keyboard shortcuts](https://the-empire.systems/nixos-gnome-settings-and-keyboard-shortcuts)
- [KDE settings with plasma manager](https://github.com/mcdonc/.nixconfig/blob/master/videos/plasma-manager/script.rst)

# hardware
See [README in hosts](./hosts/README.md).

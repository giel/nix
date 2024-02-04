Some steps to take with a minimal install of nixos

### Installation

Choose the graphical installer, and choose the options you want that are given during the install. But do the **minimal** install. 

After installation do a reboot and log in to the installed machine. Checking if network is working by doing a ping:

     ping google.com

If it is working copy the files created by the installer (as a backup), we choose the root of your home directory:

    cp /etc/nixos/* ~/.

Change (with `nano` editor) the following in the `/etc/nixos/configuration.nix`:

    services.openssh.enable = true;
    
    environment.systemPackages = with pkgs; [
      git
      vim
      wget
    ];

Apply these configuration changes with the the following command:

    sudo nixos-rebuild test

If there are no errors, the systempackages added (like `git`) are available. If you see errors, fix the errors in the `configuration.nix`. 

Now you can continue to keep the packages also after a reboot, with:

    sudo nixos-rebuild switch

Make sure you remove the boot device (CD-rom ISO, or USB stick).
Now do a reboot to see that `vim`, `git` are available:

    sudo shutdown -r now

If this is a virtual machine you may want to make a snapshot or a clone of this state to make creating a new machine easier.

### enable flakes and start using git

We want to use flakes and start using the configuration in git. We use the director `~/git/nix` to store the version controlled configuration.

You may want to use a ssh shell to log in to the machine as this makes copy and pasting commands probably easier. In the machine use the follwing commands to find the hostname and ip-address:

    hostname 
    ip addr

From an other computer log in to the machine:

    ssh <my-user-name>@<ip-address>

Now in the NixOS computer enter the following commands:

    mkdir ~/git
    cd ~/git
    git clone https://github.com/giel/nix.git  # you may need to use a clone of this
    cd nix

In this nix directory we are going to create the configuration of the new machine. We will give it a new name and activate the flakes way of working. All the configuration changes will be stored in the git repository and we can use all modules already present there. Note that you need to clone this repo and use that url to save your own repo. In the examples I will use this repo.

Make sure you have a proper git credentials set up. Copy ssh keys if needed and setup your username and email for git.

Decide how what the hostname of the machine will be. By default it is `nixos`. In the example I will change it to `vmnix01`. All the files with configuration for this `vmnix01` will reside in a directory with the same name. And we will start with a copy of the 2 configuration files in this directory.

    cd ~/git/nix
    mkdir ./hosts/vmnix01
    cp ~/etc/nixos/* ./hosts/vmnix01/

And in the `vmnix01/configuration.nix` the hostname needs to be changed and the flakes need to be enabled:

    networking.hostName = "vmnix01"; # Define your hostname.
    # Enable Flakes and the new command-line tool
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

To activate the flakes and the new machine name we need to do a last switch without using flakes. We copy the changed configuration to the old location as we cannot pass a config file as a parameter:

    cd ./hosts/vmnix01/
    sudo cp ./configuration.nix /etc/nixos/
    sudo nixos-rebuild switch 

After a reboot we will see a new hostname and we can start with flakes.

Next the configuration needs to be added to the `flake.nix` file (you can copy the configuration above it and remove some lines):

    vmnix01 = nixpkgs.lib.nixosSystem {
      inherit specialArgs;
      modules = [
        ./hosts/vmnix01/configuration.nix
        utils.nixosModules.autoGenFromInputs
      ];
    };

All the files in the nix directory need to be versioned for flakes, so add the added files to git. After that the scripts can be used for flake:

    git add .
    ./switch.sh

# links

- [Nix main site](https://nixos.org/)

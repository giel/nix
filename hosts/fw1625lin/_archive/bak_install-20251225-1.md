Installatie NixOS

    mkdir ~/git
    cd ~/git
    mkdir -p backup/1-configs
    cd backup
    sudo cp /etc/nixos/* 1-configs/

 Ga verder als `su`
 
    sudo su
    cd /etc/nixos
    
Check configuratie:

    nixos-rebuild test
    
Edit `configuration.nix`

Wijzig hostname van `nixos` naar goede naam.

Voeg de volgende packages toe:

- delta
- git
- git-lfs
- neovim
- vim
- wget

Check configuration & switch:


    nixos-rebuild test
    nixos-rebuild switch
    
Terug naar normale user `ctl-D` in dir `~/git/backup`

Maak een nieuwe backup:

    mkdir 2-configs
    cp /etc/nixos/* 2-configs/

Reboot om alles te activeren, waaronder de nieuwe naam van de computer.
Hierna gaan we de configuraties overnemen vanuit de git repo's.





    

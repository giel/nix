[giels@nixos:~]$ mkdir git
[giels@nixos:~]$ cd git 
[giels@nixos:~/git]$ git
git: command not found
[giels@nixos:~/git]$ nix-env -iA nixos.git
installing 'git-2.40.1'
these 17 paths will be fetched (52.67 MiB download, 115.25 MiB unpacked):
...
[giels@nixos:~/git]$ git clone https://github.com/giel/nix.git
Cloning into 'nix'...
...
[giels@nixos:~/git]$ cd nix/
[giels@nixos:~/git/nix]$ git status
On branch master
...

[giels@nixos:~/git/nix]$ git branch
* master
[giels@nixos:~/git/nix]$ git branch imac
[giels@nixos:~/git/nix]$ git branch
  imac
* master
[giels@nixos:~/git/nix]$ git switch imac
Switched to branch 'imac'

[giels@nixos:~/git/nix/imac]$ git config --global user.email "mgsch@mac.com"
[giels@nixos:~/git/nix/imac]$ git config --global user.name "Giel"

[giels@nixos:~/git/nix]$ mkdir imac
[giels@nixos:~/git/nix]$ cd imac
[giels@nixos:~/git/nix/imac]$ cp /etc/nixos/* .

[giels@nixos:~/git/nix/imac]$ git commit -m "initial nixos settings imac gnome"
[imac 09f9546] initial nixos settings imac gnome
...


[giels@nixos:~/git]$ eval "$(ssh-agent -s)"
Agent pid 7385
[giels@nixos:~/git]$ cd ~/.ssh/
[giels@nixos:~/.ssh]$ chmod 600 id_rsa
[giels@nixos:~/.ssh]$ chmod 600 id_rsa.pub 

[giels@nixos:~/.ssh]$ cd ~/git
[giels@nixos:~/git]$ ssh-add ~/.ssh/id_rsa
Enter passphrase for /home/giels/.ssh/id_rsa: 
Identity added: /home/giels/.ssh/id_rsa (giels@im4014)
[giels@nixos:~/git]$ git clone git@github.com:giel/inst.git
Cloning into 'inst'...
....
[giels@nixos:~/git]$ cd ~/git/nix/imac/


[giels@nixos:~/git/nix/imac]$ sudo nano /etc/nixos/configuration.nix 
....
[giels@nixos:~/git/nix/imac]$ sudo nixos-rebuild test
building Nix...
building the system configuration...
these 31 derivations will be built:
  /nix/store/iz2zgv39x1nrzv8dnkmmrrxwpm6h2gd0-system-path.drv
....

[giels@nixos:~/git/nix/imac]$ sudo nixos-rebuild switch
building Nix...
building the system configuration...
activating the configuration...
....

[giels@nixos:~/git/nix/imac]$ vim cpnix.sh 
[giels@nixos:~/git/nix/imac]$ chmod +x cpnix.sh 
[giels@nixos:~/git/nix/imac]$ ./cpnix.sh 
~/git/nix/imac ~/git/nix/imac
~/git/nix/imac
[giels@nixos:~/git/nix/imac]$ lazygit


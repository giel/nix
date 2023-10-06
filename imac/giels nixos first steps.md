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



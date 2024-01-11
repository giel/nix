# do nothing but start with sudo
sudo echo ====

nr=$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | wc -l)
echo $nr generations present:
sudo nix-env -p /nix/var/nix/profiles/system --list-generations

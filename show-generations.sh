# do nothing but start with sudo
sudo echo ====

echo generations present:
sudo nix-env -p /nix/var/nix/profiles/system --list-generations

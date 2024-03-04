# do nothing but start with sudo
sudo echo ==========================================================================
nr=$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | wc -l)
sudo nix-env -p /nix/var/nix/profiles/system --list-generations | sort -r
sudo echo "----(+"
echo "  $nr generations"
sudo echo ==========================================================================

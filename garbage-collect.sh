# do nothing but start with sudo
sudo echo ====
numberToKeep=10
echo garbage collecting: keep $numberToKeep minimal

echo generations present:
sudo nix-env -p /nix/var/nix/profiles/system --list-generations
generations_to_delete=$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | head -n -$numberToKeep | awk '{print $1}')

echo deleting...
sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +$numberToKeep

echo garbage collect...
sudo nix-store --gc

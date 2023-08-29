echo building for host: $HOSTNAME
sudo nixos-rebuild build --flake .#
#sudo nixos-rebuild build --flake .# --show-trace

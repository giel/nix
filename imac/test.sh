echo testing for host: $HOSTNAME

# pushd /etc/nixos/
sudo nixos-rebuild test --flake .#
#sudo nixos-rebuild test --flake .# --show-trace

# popd

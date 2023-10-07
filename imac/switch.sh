echo testing for host: $HOSTNAME

pushd /etc/nixos/
sudo nixos-rebuild switch --flake .#
#sudo nixos-rebuild switch --flake .# --show-trace

popd

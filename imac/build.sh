echo building for host: $HOSTNAME

untracked_count=$(git clean -n | wc -l)
if [ "$untracked_count" -gt 0 ]; then
	echo "WARNING: You have untracked files!"
fi

sudo nixos-rebuild build --flake .#
#sudo nixos-rebuild build --flake .# --show-trace

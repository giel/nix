echo building for host: $HOSTNAME

untracked_count=$(git clean -n | wc -l)
if [ "$untracked_count" -gt 0 ]; then
	echo "WARNING: You have untracked files!"
fi

if [ $# -eq 0 ]; then
	# "No arguments provided."
	if command -v nvd >/dev/null 2>&1; then
		sudo nixos-rebuild build --flake .# && nvd diff /run/current-system result
	else
		sudo nixos-rebuild build --flake .#
	fi
else
	echo "Using trace (found argument $1)"
	sudo nixos-rebuild build --flake .# --show-trace
fi

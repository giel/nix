echo switching for host: $HOSTNAME

untracked_count=$(git clean -n | wc -l)
if [ "$untracked_count" -gt 0 ]; then
	echo "WARNING: You have untracked files!"
fi

if [ $# -eq 0 ]; then
	# "No arguments provided."
	sudo nixos-rebuild switch --flake .#
else
	echo "Using trace (found argument $1)"
	sudo nixos-rebuild switch --flake .# --show-trace
fi

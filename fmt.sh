# Directory containing .nix files
directory="/home/giels/git/nix"

if [ $# -eq 0 ]; then
	echo "formatting $directory"

	# Find and format .nix files
	find "$directory" -type f -name "*.nix" | while read -r file; do
		echo "Formatting $file..."
		# nixfmt "$file"
		nix fmt "$file"
	done
else
	echo "formatting: $1"
	nix fmt "$1"
fi

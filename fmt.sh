echo formatting
# Directory containing .nix files
directory="/home/giels/git/nix"

# Find and format .nix files
find "$directory" -type f -name "*.nix" | while read -r file; do
	echo "Formatting $file..."
	nixfmt "$file"
done

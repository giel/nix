echo ------------------------------------------------------------------
nr=$(nixos-rebuild list-generations | wc -l)
nixos-rebuild list-generations | sort -r -k1.1,1.3 -n

# head -n 1 | nixos-rebuild list-generations |
# 	awk '{printf "%-12s %-21s %-24s %-10s\n", $1, $2, $3" "$4 ,$5}'

# nixos-rebuild list-generations | sort -r -k1.1,1.3 -n |
# 	awk '{
#     if ($2 == "current")
#         printf "%-12s %-21s %-24s %-10s\n", $1" "$2, $3" "$4, $5, $6;
#     else
#         printf "%-12s %-21s %-24s %-10s\n", $1, $2" "$3, $4, $5;
# }'

# nixos-rebuild list-generations | sort -r -k1.1,1.3 -n |
# 	awk 'NR==1 {printf "%-12s %-21s %-24s %-10s\n", $1, $2, $3" "$4 ,$5}
# NR > 1 {
#     if ($2 == "current")
#         printf "%-12s %-21s %-24s %-10s\n", $1" "$2, $3" "$4, $5, $6;
#     else
#         printf "%-12s %-21s %-24s %-10s\n", $1, $2" "$3, $4, $5;
# }'
echo "----(+"
echo "  $((nr - 1)) generations"
echo ------------------------------------------------------------------

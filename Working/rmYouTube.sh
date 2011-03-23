# This script will remove the keyword - "YouTube" from the beginning of every filename.

for i in *
do
	if [[ -f "$i" ]]; then
		j='YouTube - '
		fn=${i#"$j"}
		mv "$i" "$fn"
	fi
done

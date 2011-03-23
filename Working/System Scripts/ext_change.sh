# This script is made with the pupose of changing the given extension to any extension.
# Author: Rushyang Darji
# Date: 08.08.2010
# Version Build: v1
while true; do
	read -e -p "Enter Absolute path: " path || exit
	[[ -d "$path" ]] && break
	echo "Invalid path"
done

cd "$path"
echo -n "Enter current Extension: "
read ex
echo -n "Enter new Extension to replace with "
read ext

for i in *."$ex"
do
	mv "$i" ${i./\sh/}.txt
done

ls $rename | sort -n

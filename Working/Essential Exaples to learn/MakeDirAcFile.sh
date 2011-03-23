# This script will make a directory taking the filename in given directory.. and move the same file into that new make folder.

while true; do
	read -e -p "Enter the directory: " path || exit
	[[ -d $path ]] && break
	echo "Invalid Path..!"
done
cd $path
for i in *
do
	if [[ -f "$i" ]]; then
		j=${i: -4:4}
		dirname1=${i%$j}
		mkdir "$dirname1"
		mv "$i" "$dirname1"
	fi
done

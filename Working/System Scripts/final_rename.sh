#	Author: Rushyang Darji
#	Date: 04.08.2010
#	Last Build: 19.10.2010
#	This script is made with purpose of renaming bulk files.
#	
#
# 	ALGORITHM..
#	1) mkdir temp into rename
#	2) Make 2 variables rename and temp1 as in their path name.
#	3) cd to rename path
#	4) move individual file to temp
#	5) cd to temp path, rename it.
#	6) cd to rename path back.
#	7) Repeat 4-6, until end.
#	8) cd to temp path
#	9) Move all files to rename
#	10) Delete temp1.

read -e -p "Enter Directory path where files exist to rename: " rename || exit
cd "$rename"
mkdir temp1
temp="$rename/temp1"
cd "$temp"
mkdir final
final="$temp/final"

echo -n "Enter to rename from (number), excluding Extension: "
read j
echo -n "Enter Extension now: "
read ex

cd "$rename"

for i in *."$ex"
do
	mv "$i" "$temp"
	cd "$temp"
	mv "$i" "$j"."$ex"
	mv "$j"."$ex" "$final"
	cd "$rename"
	shift
	j=$(( $j+1 ))
done

cd "$final"
mv *."$ex" "$rename"
cd 
rmdir "$final"
rmdir "$temp"

ls "$rename" | sort -n


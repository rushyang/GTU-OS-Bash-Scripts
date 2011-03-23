#	Author: Rushyang Darji
#	Date: 16.08.2010
#
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

rename="/home/rushyang/Experiments/Rename"
cd $rename
mkdir temp1
temp="$rename/temp1"
cd $temp
mkdir final
final="$temp/final"

#echo -n "Enter to rename from (number), excluding Extension: "
#read j
#echo -n "Enter Exntension now: "
#read ex

cd $rename

for i in *."$ex"
do
	mv "$i" $temp
	cd $temp
	newname=`sed 's/[[:digit:]]//g' $i`
#	mv "$i" "$j"."$ex"
	mv $i $newname."$ex"
	mv "$newname"."$ex" "$final"
	cd $rename
	newname=$(( $newname+1 ))
done

cd $final
mv *."$ex" $rename
cd 
rmdir $final
rmdir $temp

ls $rename | sort -n


#!/usr/bin/env bash 
#***************GTU27***************
# 27. Write a script that deletes all leading and trailing spaces in all lines in a file. Also remove blank lines
# from a file. Locate lines containing only printf but not fprintf.
# Rushyang Darji
# Init Build: 29.11.2010
# Last Build: 29.11.2010

while true; do
	read -e -p "Enter path of a file: " filep || exit
	[[ -f "$filep" ]] && break
	echo "This is not a valid file."
done

temp=$(mktemp temp.XXXXX)
echo "After removing spaces... saved in $temp"
# Or, sed -e '/^$/d' -e '/^[<spc><tab>]*$/d' < filep > $temp
awk NF "$filep" > $temp
cat $temp

echo "Locating lines containing only printf but not fprintf.."
grep -ve "fprintf" < wrongfile | grep -e "printf" 

rm -i $temp

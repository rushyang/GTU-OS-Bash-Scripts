#!/usr/bin/env bash
# Code written By: Rushyang Darji
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts
# Final Build: 02.10.2010

while true; do

	read -e -p "Enter Directory: " path || exit
	[[ -d $path ]] && break
	echo "Invalid path! Try Again!"
done
path=${path%/}
myargs=`grep -l -e "printf" -e "fprintf" $path/*.c | xargs`

if [ $? -gt 1 ]; then		# grep exits with status 1 when no matches were found. 
	echo -n "No Matches were found. "  && exit
fi
temp=$(mktemp tmp.XXXXXXXXX)
for i in $myargs		# Here, grep has the exit status 0. 
do
	echo "Do you want to add '#include <stdio.h>' to $i?"
	read S
	case $S in
	Y|y|YES|Yes|yes|yeah)
		 sed '1i\
#include<stdio.h>' "$i" > "$temp"		# i for insertion, 1 for 1st line. $i is the file to insert. and all output will be redirected to $temp 

	mv "$temp" "$i"			# renaming $temp by over writing to $i

	;;

	n|N|NO|no|No|nope)
		echo "Alright! Next.."
		shift
	;;

	*)	
		echo "Invalid input."
	;;
	esac

done

if [ -z $myargs ]; then
	echo "No Matches were found. Try another Directory"
else
	clear
	head -n5 $path/*.c | less 
fi

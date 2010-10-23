#!/usr/bin/env bash
# GTU 9
# Code Developed by: Rushyang Darji
# Last Updated: 14.10.2010
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts
# Remember, You should NEVER parse the output of "ls" command and use into scripts. Because UNIX filesystem allows all kind of characters to assign a filename, including "new line". For more info.. Google "parsing output of ls".
# read -e enables Tab Completion which is way too easier than entering whole absolute path.
read -e -p "Enter Absolute Path: " path || exit
temp=$(mktemp)
if test -d $path; then

	for i in $path/*
	do 	
		if test -x "$i"; then
			echo "$i" >> "$temp"
		fi
	done
else
	echo "Invalid Directory"
fi

cat $temp
rm $temp

#!/usr/bin/env bash
# GTU 2 (f)
# Code written By: Rushyang Darji
# Last Build: 10.10.2010
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts
ls
echo "Enter a filename: "
read FILE

temp=$(mktemp tmp.XXXXX)
if [ -f $FILE ]; then
	rev $FILE > $temp
	echo "Data successfully fetched into $temp"
	cat $temp
else
	echo "File does not exist"
fi

rm -i $temp

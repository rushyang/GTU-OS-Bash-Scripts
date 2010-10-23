#!/usr/bin/env bash
# GTU2e.sh Accept filename and displays last modification time if file exists, otherwise display appropriate message.
# Code written By: Rushyang Darji
# Last Build: 10.10.2010
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts


echo "Enter the filename"
read FILE

if [ -f $FILE ]; then
	echo "The file exists."
	echo "Last modification time is." 
	ls -l $FILE | awk '{print $6" "$7}' # prints 6th and 7th column from tabular result of ls -l
else
	echo "The file does not exist"
fi

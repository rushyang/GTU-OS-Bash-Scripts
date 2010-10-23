#!/usr/bin/env bash
# GTU3: Write a script to find the global complete path for any file.
# Code written By: Rushyang Darji
# Last Updated: 19.10.2010
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts

echo -e "Enter the filename to search in current directory: \c"
read FILE

args=`find . -name $FILE | xargs`	# xargs builds arguments from find, for using in "for loop"... Remember, you should never Parse result of "ls" in any case. At the same concept, linux search facility for file system works.

for i in $args	
do 
	if [ -f "$i" ]; then	
		CPATH=`readlink -f "$i"`	# readlink returns the symbolic link, -f canonicalize by every parent directory recursively.
		echo $CPATH
	fi
done

noargs=${#args}					# noargs stores total number of arguments.
if [ "$noargs" -eq "0" ]; then
	echo "No such a file exists"
fi




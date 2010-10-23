#!/usr/bin/env bash
# Write a script to display the name of those files (in the given directory) which are having multiple links.
# Developed By: Rushyang Darji
# Init Build: 15.10.2010
# Last Build: 15.10.2010
# v1.0
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts

echo "Enter Absolute path of directory"
read path

if test -d $path; then
	cd $path
	for i in *
	do
		for j in *
		do	
			if test "$i" != "$j"; then
				if test "$i" -ef "$j"; then
					echo "$i" >> $$.temp
				fi
			fi			
		done
	done 
	cat $$.temp | uniq
	rm $$.temp
	cd -
else
	echo "Check your path."
fi

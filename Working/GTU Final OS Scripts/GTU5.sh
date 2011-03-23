************************GTU5************************
#!/usr/bin/env bash
# GTU 5 - Write a script to copy the file system from two directories to a new directory in such a way that only the latest file is copied in case there are common files in both the directories.
# Code written By: Rushyang Darji
# Last Build: 24.08.2010
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.

EXIT=n
while [ $EXIT != y ]
do
	sleep 1
	echo -e "\n"
	echo -e "	1. Display PWD
	2. Long Listing
	3. Change Directory
	4. Copy Newest File. 
	5. Exit	
	Enter Choice: \c"
	read ch

case $ch in 

1) 
	clear
	pwd
;;

2) 	
	clear
	pwd
	ls -l
;;

3) 
	echo -n "Enter Absolute Path to change directory: "
	read apath

	cd $apath

	if [ $? -eq 0 ]; then			# We can also check for availibility of directory before 'cd' command by 'test -d $apath' i.e. 'if [ -d $apath ]'
		clear
		echo "Working Directory Changed successfully to.."
		sleep 1
		pwd
	else
		clear
		echo "Please check your PATH."
	fi
;;

4) 
	clear
	echo "Enter filenames to copy. ( * - for ALL Files, ELSE Separate files by spaces )"
	read allfiles
	if [ -f $allfiles ]; then
		echo "Enter Absolute path, where to copy these files: "
		read -e cpath
		if [ -d $cpath ]; then
			cp -u "$allfiles" $cpath		# -u copies only when the SOURCE file is newer than the destination file or when the destination file is missing
		else
			echo "There is no such a directory!"
		fi
	else
		echo "There is/are no such file(s)!"
	fi
;;

5) 
	clear 
	echo -n "Exiting.."
	sleep 1
	echo -n "."	
	sleep 1
	echo -n "."
	clear
	exit
;;

*)
	clear
	echo "Invalid Choice"
;;

esac
done



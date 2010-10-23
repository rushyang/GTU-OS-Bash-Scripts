#!/usr/bin/env bash
# Code written By: Rushyang Darji
# Last Build: 09.10.2010
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts

while true; do
	read -e -p "Enter first Directory's Absolute path: " path1 || exit
	[[ -d $path1 ]] && break
		echo "Invalid path, Try Again!"
done

while true; do
	read -e -p "Enter second Directory's Absolute path: " path2 || exit
	[[ -d $path2 ]] && break
		echo "Invalid path, Try Again!"
done

while true; do
	read -e -p "Enter Third Directory's Path, to copy files in case of exact match: " path3 || exit
	[[ -d $path3 ]] && break
		echo "Invalid Path, Try, Again!"
done

temp=$(mktemp)
for i in $path1/*
do	
	if [ -f "$i" ]; then
	for j in $path2/*
	do
		if [ -f "$j" ]; then
		base1=`basename "$i"`
		base2=`basename "$j"`
		if [ "$base1" = "$base2" ]; then
			diff "$i" "$j" > $temp
			
			size=`ls -s $temp | awk '{print $1}'`
			if [ "$size" -eq "0" ]; then
				echo "File: \"$base1\" was found same in both directories."
				cp "$i" "$path3"
				echo "Copied to \"$path3\" successfully!"
			fi
		fi
		fi
	done
	fi
done

rm $temp

: << -- 
	OUTPUT (Attempt 1)
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU6-2.sh 
Enter first Directory's Absolute path: /home/rushyang/sldjf
Invalid path, Try Again!
Enter first Directory's Absolute path: /home/rushyang/Experiments/1510/mydir1/
Enter second Directory's Absolute path: /home/rushyang/lsajlj
Invalid path, Try Again!
Enter second Directory's Absolute path: /home/rushyang/Experiments/1510/mydir2/
Enter Third Directory's Path, to copy files in case of exact match: /home/rushyang/Experiments/1510/mydir3/
File: "1" was found same in both directories.
Copied to "/home/rushyang/Experiments/1510/mydir3/" successfully!
File: "new file" was found same in both directories.
Copied to "/home/rushyang/Experiments/1510/mydir3/" successfully!


	OUTPUT (Attempt 2)
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU6-2.sh 
Enter first Directory's Absolute path: /home/rushyang/Experiments/1510/mydir1/
Enter second Directory's Absolute path: /home/rushyang/Experiments/1510/mydir2/
Enter Third Directory's Path, to copy files in case of exact match: /home/rushyang/Experiments/1510/mydir3/
File: "1" was found same in both directories.
Copied to "/home/rushyang/Experiments/1510/mydir3/" successfully!
File: "new file" was found same in both directories.
Copied to "/home/rushyang/Experiments/1510/mydir3/" successfully!
-- 

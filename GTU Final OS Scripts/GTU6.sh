************************GTU6************************
#!/usr/bin/env bash
# Code written By: Rushyang Darji
# Last Build: 09.10.2010
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.

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
########################   OR    ########################

#!/usr/bin/env bash
# Code written By: Rushyang Darji
# Last Build: 02.10.2010
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.

: << -- 
GTU 6: Write a script to compare identically named files in two different directories and if they are same, copy
one of them in a third directory

Code Developed By: Rushyang Y Darji (rushyang@yahoo.co.in)
Init Build: 04.08.2010
Last Build: 15.10.2010
v1.6
--

clear
temp=$(mktemp tmp.XXXXXXXX)	#mktemp makes temporary file into /temp directory with r+w permissions only for creator.
echo -n "Enter 1st Directory: "
read dir1
PATH1="$(pwd)/$dir1"	#Converted whole path of dir1 into PATH1 variable 
echo "PATH1=$PATH1"
main=$(pwd)
if test -d $PATH1; then	#Test condition to make sure dir1 is a directory.
	echo -n "Enter 2nd Directory: "
	read dir2
	PATH2="$(pwd)/$dir2"	#Same as Line 14
	echo "PATH2=$PATH2"
	if test -d $PATH2; then
		cd $PATH1	#Secured for using for i loop.
		for i in *
		do
			cd $PATH2	#Secured for using for j loop.
			for j in *
			do
				if test "$i" == "$j"; then
					cd $main		#Back to $(basedir)
					cmp "$PATH1/$i" "$PATH2/$j" > $temp	
					# cmp checks byte by byte.. can be little slower than 'diff' 
					size=`ls -s $temp | awk '{print $1}'` # '-s' for listing size, and 'awk' for fetching size of $temp
					if test "$size" == "0"; then	# if size of temporary file is 'ZERO', then both files are exactly same.
						echo "File: \"$i\" was found same in both directories."
						echo -n "Enter Directory name (must be in current working directory) to copy it: "
						read dir3
						PATH3="$(pwd)/$dir3"	#Same as Line 14
						if test -d $PATH3; then	
							cp -i "$PATH1/$i" "$PATH3"	# "$PATH2/$j" instead of "$PATH1/$i" will also do.
						else
							echo "There is no directory named $dir3 in $pwd"	#Line 41
						fi
					fi
					
				fi
			done
		done
	else
		echo "Invalid Directory Name for dir2."	#Error Message of missing dir2
	fi
else
	echo "Invalid Directory Name for dir1."	#Error Message of missing dir3
fi

rm $temp	

: << -- 
rushyang@Maverick_Meerkat: 1510 $ ls mydir1/
1  2  new file
rushyang@Maverick_Meerkat: 1510 $ ls mydir2/
1  new file  T
rushyang@Maverick_Meerkat: 1510 $ ls mydir3/

		OUTPUT (Attempt 1)
Enter 1st Directory: asdf
PATH1=/home/rushyang/Experiments/1510/asdf
Invalid Directory Name for dir1.

		OUTPUT (Attempt 2)
Enter 1st Directory: mydir1
PATH1=/home/rushyang/Experiments/1510/mydir1
Enter 2nd Directory: mydir2
PATH2=/home/rushyang/Experiments/1510/mydir2
File: "1" was found same in both directories.
Enter Directory name (must be in current working directory) to copy it: mydir3
File: "new file" was found same in both directories.
Enter Directory name (must be in current working directory) to copy it: mydir3

		OUTPUT (Attempt 3)
Enter 1st Directory: mydir1	
PATH1=/home/rushyang/Experiments/1510/mydir1
Enter 2nd Directory: mydir2
PATH2=/home/rushyang/Experiments/1510/mydir2
File: "1" was found same in both directories.
Enter Directory name (must be in current working directory) to copy it: mydir3
cp: overwrite `/home/rushyang/Experiments/1510/mydir3/1'? y
File: "new file" was found same in both directories.
Enter Directory name (must be in current working directory) to copy it: mydir3
--


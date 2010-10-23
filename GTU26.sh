# !/usr/bin/env bash
# 26. Interactive - non-interactive shell script to prompt and delete c files within the given or predefined current directory.
# Code written By: Rushyang Darji
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts
# Last Build: 19.10.2010

N=$#
ext=c
if test "$N" -eq "0"; then
	while true; do	# Same inifinite loop as we used in GTU24
		read -e -p "Enter Path: " path || exit
		[[ -d $path ]] && break
		echo "Invalid Path, Try Again!"
	done

	path=${path%/} # Removes last / from the end of the path. Though, it's not compulsion to do so because /foo/bar and /foo//////bar is considered exactly the same!

	for i in $path/*.C
	do
		if [ "$i" != $path/'*.C' ]; then # If there is no match, Value of i will be ''$path/*.C''. & That's why there is no need to rename.
			mv "$i" "${i/.C/}".c	# Renames every .C files to .c, so that we can use it afterwards in same loop.
			clear 
		fi
	done
	
	for i in $path/*."$ext"
	do
		if [ "$i" != "$path"/'*.c' ]; then # If there is no ".C FILE" exist in that directory, it will switch to else.
		clear
		echo "File is $i"
		head -n10 "$i" | nl	# head for displaying First 10 lines, nl for numbering them on terminal.
		sleep 1			# Halt for 1 second
		rm -i "$i"		# -i for interactive prompt.
		# Remember, "" around $i is super necessary! Because except it, you'll get an error with filenames containing spaces.
		else
			echo "There are no matching \"C\" files to Prompt in this directory."
			sleep 2
			clear=no
		fi
	done

	if test "$clear" != "no"; then  # If clear=no then there are no C Files to display.
		clear
		echo "Remaining C files in the Directory..."
		ls -1 $path/*.c			# 1 result per line (-1)
	fi
else	# Else part contains, where user passes the name of C files, which should exist in the current working directory as the parameter.
	for i in $path/*.C
	do
		if [ "$i" != $path/'*.C' ]; then   # if There are no matches ie if there is no C file in given dir, 'i' will be ''$path/*.C''
		mv "$i" "${i/.C/}".c	# Renames every .C files to .c
		clear 
		fi
	done
	
	for i in $*			# When filenames are passed as parameters.
	do	
		clear
		i="${i/.c/}"		# Removes an extension from file variable 'i' Only in the case of extension is also passed within the filename parameter. 
		i="$(pwd)/$i.c"		# Makes i the complete path of a file, including extension..
	# Last two lines are necessary because user, may and may not enter filename including extension.
		if [ -f "$i" ]; then	# Checks for the existence of given filename, into pwd
			echo "File name is $i"
			head -n10 "$i" | nl	
			sleep 1
			rm -i "$i"
		else			# Error for non-Existent files.
			echo "There is no such a file with name: \"$i\" in current working directoy"
			sleep 3
		fi
	done
	clear
	echo "Remaining C files in the Directory..."
	ls -1 *.c
	sleep 1
fi



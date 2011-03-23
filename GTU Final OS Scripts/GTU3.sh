************************GTU3************************
#!/usr/bin/env bash
# GTU3: Write a script to find the global complete path for any file.
# Code written By: Rushyang Darji
# Last Updated: 19.10.2010
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.

echo -e "Enter the filename to search in current directory: \c"
read FILE

args=`find . -name $FILE | xargs`	# xargs builds arguments from find, for using in "for loop"... Remember, you should never Parse result of "ls" in any case because unix allows every character to be used in naming files, even if a "new line character"... execute "touch $'A\nFile'" to make file and ls to know it. Google "parsing output of ls" to know more. 

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




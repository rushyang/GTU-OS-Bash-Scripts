***************GTU25***************
#!/usr/bin/env bash
# Code written By: Rushyang Darji
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.
# Final Build: 02.10.2010

while true; do

	read -e -p "Enter Directory: " path || exit
	[[ -d $path ]] && break
	echo "Invalid path! Try Again!"
done
path=${path%/}
myargs=`grep -l -e "printf" -e "fprintf" $path/*.c | xargs`

if [ $? -gt 1 ]; then		# grep exits with status 1 when no matches were found. 
	echo -n "No Matches were found. "  && exit
fi
temp=$(mktemp tmp.XXXXXXXXX)
for i in $myargs		# Here, grep has the exit status 0. 
do
	echo "Do you want to add '#include <stdio.h>' to $i?"
	read S
	case $S in
	Y|y|YES|Yes|yes|yeah)
		 sed '1i\
#include<stdio.h>' "$i" > "$temp"		# i for insertion, 1 for 1st line. $i is the file to insert. and all output will be redirected to $temp 

	mv "$temp" "$i"			# renaming $temp by over writing to $i

	;;

	n|N|NO|no|No|nope)
		echo "Alright! Next.."
		shift
	;;

	*)	
		echo "Invalid input."
	;;
	esac

done

if [ -z $myargs ]; then
	echo "No Matches were found. Try another Directory"
else
	clear
	head -n5 $path/*.c | less 
fi

rm $temp

########################   OR   ########################

#!/usr/bin/env bash
# GTU25: Write a shell script to add the statement #include <stdio.h> at the beginning of every C source file in current directory containing printf and fprintf.
# Code written By: Rushyang Darji
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.
# Final Build: 19.08.2010
# If you want to rename and include all ".C" files too, Refer GTU26.sh
myargs=`grep -l -e "printf" -e "fprintf" *.c | xargs`

if [ $? -gt 1 ]; then		# grep has exit status 1 when no matches were found. 
	echo -n "No Appropriate Matches were found. "
fi

for i in $myargs		# Here, grep has the exit status 0. 
do
	echo "Do you want to add '#include <stdio.h>' to $i?"
	read S
	case $S in
	Y|y|YES|Yes|yes|yeah)
		 sed '1i\
#include<stdio.h>' "$i" > $$		# i for insertion, 1 for 1st line. $i is the file to insert. and all output will be redirected to $$ (or you can say temp... Actually $$ returns terminal id. but when output is directed to it, a file is made)
	mv $$ $i			# renaming $$ by over writing to $i

	;;

	n|N|NO|no|No|nope)
		echo "Alright!"
		shift
	;;

	*)
	;;
	esac

done

if [ -z $myargs ]; then
	echo "No Matches were found. Try another Directory"
else
	clear
	head -n5 *.c | less 
fi

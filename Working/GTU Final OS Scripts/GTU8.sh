************************GTU8************************
#!/usr/bin/env bash
# Write a script to display the name of those files (in the given directory) which are having multiple links.
# Developed By: Rushyang Darji
# Init Build: 15.10.2010
# Last Build: 15.10.2010
# v1.0
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.

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

###############   OR   ###############

#!/usr/bin/env bash
# Write a script to display the name of those files (in the given directory) which are having multiple links.
# Developed By: Rushyang Darji
# Init Build: 15.10.2010
# Last Build: 15.10.2010
# v1.0
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.

temp=$(mktemp tmp.XXXXXXXXXX)
while true; do
	read -e -p "Ente the Absolute Path: " path || exit
	[[ -d $path ]] && break
	echo "Invalid Directory!"
done

for i in $path/*
do
	for j in $path/*
	do
		base1=`basename $i`
		base2=`basename $j`
		if test "$base1" != "$base2"; then
			if test "$base1" -ef "$base2"; then
				echo "$base1" >> $temp
			fi
		fi
	done
done

cat $temp | uniq
rm $temp


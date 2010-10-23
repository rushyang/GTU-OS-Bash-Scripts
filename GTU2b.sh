#!/usr/bin/env bash
# GTU2b.sh This script will check whether entered number of string is pelindrome or not. (AIO script for numbers, strings, including special characters)
# Code written By: Rushyang Darji
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts

echo -n "Enter string: "
read string

N=${#string}	# Total no of characters of a string.

mid=$(($N/2))
i=0

while [ $i -lt $mid ]
do
	if [ "${string:$i:1}" != "${string: -$(($i+1)):1}" ];	then	# ${string:$i:1} will check 1 character from "ith" position from front. Note that i starts from 0.
	# ${string: -$(($i+1)):1} will move from back. As i progresses, -$(($i+1)) value gets near to i. 
	# As soon as Any two characters are found unmatched, It will prompt as not pelindrome, and exit quickly.
		echo "String is not a pelindrome"
		exit
	else
		i=$(($i+1))
	fi
done

echo "String is pelindrome"

: << -- OUTPUT 
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2b.sh 
Enter string: rushyang
String is not a pelindrome
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2b.sh 
Enter string: 1234321
String is pelindrome
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2b.sh 
Enter string: 12abba21
String is pelindrome
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2b.sh 
Enter string: qwejkllkjewq
String is pelindrome
--

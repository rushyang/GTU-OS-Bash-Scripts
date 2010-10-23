#!/usr/bin/env bash
# Code written By: Rushyang Darji
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts
: << --
GTU 16: This shell script is made with the purpose of checking whether particular user is currently logged in or not. (With the method of grep, instead of file size)

Developed By: Rushyang Darji
Init Build: 13.08.2010
Last Buld: 13.08.2010
Version: v1.8
--

echo -e "Enter name of user: \c"
read myname


finaluser=`who | awk '{print $1}' | sed -n /^$myname$/p | head -n1`
if [ "$myname" = "$finaluser" ]; then
	echo "User is currently logged in."
	sleep 1
	who | sed -n /^$myname/p 
else
	echo "User is not currently logged in. "
fi



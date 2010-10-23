#!/usr/bin/env bash
# Code written By: Rushyang Darji
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scriptss
: << --
This shell script will verify whether the user is logged in or not.
Developed By: Rushyang Darji
Init Build: 13.08.2010
Last Build: 13.08.2010
Version: v1.4
--

echo -e "Enter username to verify whether he is logged in or not: \c"
read myname

who | awk '{print $1}' > allusers_dummy.log
sed -n /^$myname$/p allusers_dummy.log > finalusers_dummy.log
SIZE=`ls -s finalusers_dummy.log | awk '{ print $1 }'`

if [ $SIZE -eq 0 ]; then
	echo "User is not logged in"
else
	echo "User: $myname is currently logged in"
	sleep 2
	who | sed -n /^$myname/p 
fi

rm allusers_dummy.log
rm finalusers_dummy.log

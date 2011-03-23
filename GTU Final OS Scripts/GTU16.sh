*********************GTU16*********************
#!/usr/bin/env bash
# Code written By: Rushyang Darji
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scriptss
: << --
This shell script will verify whether the user is logged in or not.
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

# OR

#!/usr/bin/env bash
# Code written By: Rushyang Darji
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts

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



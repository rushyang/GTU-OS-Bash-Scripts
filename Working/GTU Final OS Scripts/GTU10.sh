************************GTU10************************
#!/usr/bin/env bash
# GTU10: Write a script to display the date, time and a welcome message (like Good Morning should be displayed with “a.m.” or “p.m.” and not in 24 hours notation.
# Code written By: Rushyang Darji
# Last Updated: 19.08.2010
# Visit My Online Repository: "http://github.com/rushyang/GTU-OS-Bash-Scripts" for regular updates and more scripts.


msg2=`date +%H`
echo "Welcome $USERNAME!"
time=`date +"%F  %I:%M:%S %p"`
echo "Current Time is: $time"

if [ "$msg2" -ge "5" ] && [ "$msg2" -lt "12" ]; then 
	echo "Good Morning..!"
elif [[ "$msg2" -ge "12" ]] && [[ "$msg2" -lt "17" ]]; then 
	echo "Good Afternoon..!"
elif [[ "$msg2" -ge "21" ]] && [[ "$msg2" -lt "19" ]]; then
	echo "Good Evening..!"
else
	echo "Good Night..!"
fi

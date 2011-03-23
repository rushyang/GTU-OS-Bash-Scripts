#!/bin/sh
#	This script is to show usage of sleep command. 
#	Author: Rushyang Darji
#	Date: 04.08.2010

if [ $# -eq 0 ]; then
	count=5
	while [ $count -gt 0 ]
	do
		echo "$count seconds to go for supper time."
		sleep 1
		count=$(( $count-1 ))
	done
	echo "Supper Time! yeah! Let's eat!"
else 
	count=$1
	while [ $count -gt 0 ]
	do 
		echo "$count seconds to go for supper time. $(date +%N)"
		count=$(( $count-1 ))
		sleep 1
	done

	echo "Supper Time! yeah! Let's eat!"
fi

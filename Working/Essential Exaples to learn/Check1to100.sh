#	A shell script, will give valid numbers from 1 to 100, passed as parameter.
#
#	Author: Rushyang Darji
#	Date: 04.08.2010

N=$#

if [ "$N" -eq 0 ]; then
	echo "oh, c'mon man. Pass At least one parameter!"
else
	for NUM in $*
	do
		if [ "$NUM" -lt 1 ] || [ "$NUM" -gt 100 ]; then
			echo "$NUM is invalid"
		else
			echo "$NUM is valid"		
		fi
	done

fi

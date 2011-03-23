user=$1
user1=$LOGNAME

if [ "$user" == "$user1" ]; then
	echo "User is same"
else
	echo "User is not same"
fi

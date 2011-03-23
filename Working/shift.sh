count=0
number=$#

while [ $count -lt $number ]
do	
	count=`expr $count + 1`
	#TOKEN='$'$count
	#echo "TOKEN = $TOKEN"
	shift
done

echo "count is $count"

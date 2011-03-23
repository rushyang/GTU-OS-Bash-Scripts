***********************GTU13***********************
echo "Enter the filename: "
read file2
lim=`wc -l < $file2`
echo $lim
i=2
while [ $i -le $lim ];
do
	temp=$(mktemp)
	sed -n "$i"p < $file2 > $temp
	roll=`cat $temp | awk '{print $1}'`
	name=`cat $temp | awk '{print $2}'`
	sub1=`cat $temp | awk '{print $3}'`
	sub2=`cat $temp | awk '{print $4}'`
	sub3=`cat $temp | awk '{print $5}'`
	total=`echo $sub1+$sub2+$sub3 | bc`
	per=`echo "scale=2; $total/3" | bc`
	echo "====== Marksheet for Student \"$i\" ======="
	echo -e "Roll\tName\tSubject1\tSubject2\tSubject3\t Grand Total \t Percentage"
	echo -e "$roll \t $name \t $sub1 \t\t $sub2 \t\t $sub3 \t\t $total \t\t $per"
	rm $temp
	i=$(( $i+1 ))
done

read -p "Enter number: " no 

display()
{
	i=1	
	while [[ $i -le $no ]]
	do
		echo -n "* "
		if [[ $i -eq $no ]]; then
			echo -e "\n"
		fi
		i=$(($i+1))
	done
}

if [[ "$no" -eq "1" ]]; then
	display $no
elif [[ "$no" -eq "2" ]]; then
	display $no
	display $no
elif [[ "$no" -gt "2" ]]; then
	display $no
	no2=$(($no-2))
	x=1
	while [[ "$x" -le "$no2" ]];do
		y=1
		#echo -e "\n"
		while [[ "$y" -le "$no" ]];do
			if [[ "$y" -eq "1" ]]; then
				echo -n "* "
			elif [[ "$y" -eq "$no" ]]; then
				echo -n "* "
			else
				echo -n "  "
			fi
			y=$((y+1))
		done	
		echo -e "\n"
		x=$(($x+1))
	done
	display $no
else
	echo "Invalid number"
fi

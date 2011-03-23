************GTU19************
# Write a script to calculate gross salary for any number of employees
# Gross Salary =Basic + HRA + DA.
# HRA=10% and DA= 15%.

read -p "How many employees data, you want to enter? " no
i=1

while [ $i -le "$no" ]; 
do
	read -p "Enter basic salary of Employee $i: " basic
	HRA=`echo "scale=2; $basic*15/100" | bc`
	DA=`echo "scale=2; $basic/10" | bc`
	
	echo "Gross Salary of employee $i: " `echo "$basic+$HRA+$DA" | bc`
	# i=$(( $i+1 ))
	i=`expr $i + 1`
done

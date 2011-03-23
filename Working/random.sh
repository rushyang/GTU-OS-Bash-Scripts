# 
for (( i=1 ; i<=50 ; i++ ))
do
	ran=$(( ( RANDOM % ( 48 - 1 ) ) + 1 ))
	echo $ran
done

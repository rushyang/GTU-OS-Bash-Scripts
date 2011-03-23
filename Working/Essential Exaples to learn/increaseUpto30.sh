j=1
exp="$HOME/Working"
cd $exp
while [ $j -le 30 ] 
do
	echo "$j" >> $exp/incr
	j=$(( $j+1 ))
done

pwd

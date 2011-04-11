#!/bin/bash

temp=$(mktemp)
trap "rm $temp; exit" 2 

for i in {1..12}; do 
	echo "This is number $i" >> $temp | tee >1
	sleep 1
done



**********************GTU17**********************
# Write a script to perform operations on data file.
# The file contains data for following fields.
# EMP/NO, NAME, AGE, GENDER, DESIGNATION, BASIC/SALARY
# Provide Menu Driven facility for: 
# 1. Add Record
# 2. Delete Record
# 3. Modify Record
# 4. View All Record
# 5. Count Total Number of Records
# 6. Exit

datafile="/home/rushyang/Experiments/1911/datafile"
echo "Datafile is: $datafile"
cat $datafile

while true; do

read -p "
1. Add Record
2. Delete Record
3. Modify Record
4. View All Record
5. Count All Number of Records
6. Exit 
Select Your Choice: " ch || exit

case $ch in 
1)
	echo "Enter The Following data: "
	read -p "EMP NO: " empno
	read -p "EMP NAME: " empname
	read -p "AGE: " age
	read -p "GENDER: " gen
	read -p "DESIGNATION: " des
	read -p "BASIC SALARY: " basic
	echo -e "$empno\t$empname\t\t$age\t$gen\t$des\t\t$basic\n" >> $datafile
	tmp=$(mktemp tmp.XXXX)
	awk NF < "$datafile" > "$tmp"
	mv "$tmp" "$datafile"
;;
2)
	temp=$(mktemp tmp.XXXXX)
	read -p "Enter the employee id, which you want to delete: " empid
	grep -v "^$empid" < $datafile > $temp
	mv $temp $datafile
;;
3)
	temp=$(mktemp tmp.XXXXX)
	temp2=$(mktemp tmp.XXXXX)
	temp3=$(mktemp tmp.XXXXX)
	read -p "Enter the employee ID, you want to edit" empid
	grep -v "$empid" < "$datafile" > $temp
	grep "$empid" < "$datafile" > "$temp2"
	read -p "Enter Field NO to edit: " fno
	if test "$fno" = 1; then
		olddata=`cat "$temp2" | awk '{print $1}'`
		read -p "Enter new Empid" newempid 
		sed s/$oldata/$newempid/g < "$temp2" > $temp3
	elif test "$fno" = 2; then
		olddata=`cat "$temp2" | awk '{print $2}'`
		read -p "Enter new name" newname
		sed s/$oldata/$newname/g < "$temp2" > $temp3
	elif test "$fno" = 3; then
		olddata=`cat "$temp2" | awk '{print $3}'`
		read -p "Enter new age: " newage
		sed s/$olddata/$newage/g < "$temp2" > $temp3
	elif test "$fno" = 4; then
		olddata=`cat "$temp2" | awk '{print $4}'`
		read -p "Enter Gender: " newgen 
		sed s/$oldata/$newgen/g < "$temp2" > $temp3
	elif test "$fno" = 5; then
		olddata=`cat "$temp2" | awk '{print $5}'`
		read -p "Enter new Designation: " newdes
		sed s/$oldata/$newdes/g < "$temp2" > $temp3
	elif test "$fno" = 6; then
		olddata=`cat "$temp2" | awk '{print $6}'`
		read -p "Enter new salaray: " newsal
		sed s/$oldata/$newsal/g < "$temp2" > $temp3
	fi
	mv "$temp3" "$temp2"
	cat "$temp2" >> $temp
	cat "$temp" | uniq > "$datafile"
	rm "$temp"
;;
4)
	echo "Datafile is: $datafile"
	cat $datafile
;;
5)
	temp=$(mktemp tmp.XXXXX)
	awk NF < $datafile > $temp
	mv $temp $datafile
	lineno=`wc -l $datafile | awk '{print $1}'`
	echo "Total Number of data in the file: $(( $lineno-1 ))"
;;
6)
	exit
;;
*)
	echo "Invalid Choice."
;;
esac
done

#!/usr/bin/env bash
# GTU2 Accept strings and replace a string by another string.
# Code written By: Rushyang Darji
# My Online Repository: http://github.com/rushyang/GTU-OS-Bash-Scripts

echo "Enter the Main string: "
read string

temp=$(mktemp)		# mktemp makes temporary file.
echo $string > $temp
echo "You entered..."	# just making sure, whether making temp was successful or not.
cat $temp

echo "Enter sub-string you want to replace..."
read str1

echo "Enter sub-string you want to relace with..."
read str2

sed -n s/$str1/$str2/gp < $temp	
# s stands for "substitution", 
# $str1 is what should be replaced. $str2 is from what $str1 should be replaced. 
# g stands for "Global". Without it, only first match of $str1 will be replaced with $str2, and rest of $str1 will stay as it was.

rm $temp # Removing temp file.

: << -- 
	OUTPUT
rushyang@Maverick_Meerkat: GTU-MCA $ bash GTU2d.sh 
Enter the Main string: 
The old fox jumps over the big rock.
You entered...
The old fox jumps over the big rock.
Enter sub-string you want to replace...
fox
Enter sub-string you want to relace with...
frog
The old frog jumps over the big rock.
--

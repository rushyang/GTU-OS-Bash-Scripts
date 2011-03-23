#
#Author: Rushyang
#Date: 03.08.2010
#

testing="mobi dick"

# Single (') and double (") quotes will behave differently.
# Single quotes tell bash NOT to get the the value of variable name.

echo "Here is what $testing looks like in double quote"
echo 'Here is what $testing look like in single quote'


# Single quotes (') are commonly used to allow the special operator to be part of the string
# Special characters of note are as follows $ | # & ? * < > ' [ ] \ 

testing2='$testing';	#Here, single quote (') will tell BASH NOT to assign testing's value. 

echo "Here is what $testing2 looks like by using single quote in assignment."

# Another way to assign a special character to a variable is by using the backslash (\)

testing3=\$testing;

echo "Here is what $testing3 looks like by using backslash in assignment."

d_size= `du -s /home/rushyang/Working_Shell_Scripts | cut -f 1`

echo "Working_Shell_Scripts directory is of $d_size."



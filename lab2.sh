#!/bin/bash
#Andrew Gordon
#Lab 2

#Objective: Prompt the user for a number, ensure it's a number and check to see if it's an EVEN number. 
# Create a script called lab2.sh
# Prompt the user to enter a number
# Make sure the input is a number
# Check the number to see if the number is even/odd
# If it's even output a message
# If it's odd output a message
# Focus on proper formatting and readability
# It should handle ANY base 10 integers (even 0 or numbers prefixed by 0)
# Comment your code if necessary

#Items to use:
#
#    conditional
#    echo
#    grep  or pattern matching?
#    read

echo "Enter number"
read INPUT

if [[ $INPUT =~ ^-?[0-9]+$ ]]
then
	BOOLEAN=YES
else
	BOOLEAN=NO
fi

if [ $BOOLEAN = YES ]
then 
	REMAINDER=$(expr $INPUT % 2)
else
	echo "$INPUT is not a number"
fi

case $REMAINDER in
	"0") echo "Number is even";;
	"1"|"-1") echo "Number is odd";;
esac

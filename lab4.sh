#!/bin/bash
#Andrew Gordon
#Lab 4

#Objective: Use logical ANDs and ORs in conditions to simplify your code. Prompt the user for a number, sanitize the input (eg make sure the input is an integer) and using a logical AND to ensure it's between 50 and 100.  Do this with ONE if conditional. 
#    Prompt the user for an integer
#    Ensure it's an integer
#    Check to see if it's in the desired range (50-100)
#    Let the user know if it's a success

echo "Enter number between 50 and 100"
read INPUT

if [[ $INPUT =~ ^-?[0-9]+$ ]] && [[ $INPUT -ge 50 ]] && [[ $NUMBER -le 100 ]]
then
	echo "Congratz, your number fits!"
else
	echo "Input doesn't fit"
fi

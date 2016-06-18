#!/bin/bash
#Andrew Gordon
#Lab 1

#Objective: Prompt the user for a number and check to see if it's larger than 5
# Create a script called lab1.sh
# Prompt the user to enter a number
# Check the number to see if it's larger than 5 and output a message
# If it's not larger than 5 output a message
# Focus on proper formatting and readability
# Comment your code if necessary

#Items to use:
#
#    conditional
#    echo
#    read

echo "Please enter a number"
read NUMBER

if [[ $NUMBER -gt 5 ]] ;then
	echo "$NUMBER is greater than 5"
else echo "$NUMBER is not greater than 5"
fi



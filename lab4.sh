#!/bin/bash
echo "Enter number between 50 and 100"
read INPUT

if [[ $INPUT =~ ^-?[0-9]+$ ]] && [[ $INPUT -ge 50 ]] && [[ $NUMBER -le 100 ]]
then
	echo "Congratz, your number fits!"
else
	echo "Input doesn't fit"
fi

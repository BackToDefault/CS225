#!/bin/bash

echo "Please enter a number"
read NUMBER

if [[ $NUMBER -gt 5 ]] ;then
	echo "$NUMBER is greater than 5"
else echo "$NUMBER is not greater than 5"
fi



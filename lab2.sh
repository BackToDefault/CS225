#!/bin/bash
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

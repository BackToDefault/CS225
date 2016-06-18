#!/bin/bash
#Andrew Gordon
#Lab 7

#Objective: Make a shell script that takes one argument and duplicates the functionality of the basename command using pattern matching.

#Desired Output:
#lab7.sh /home/bob/test.txt
#test.txt

shopt -s extglob

INPUT=$1
VAR=${INPUT%%+(/)}

if [[ $INPUT = "" ]] ;then
	echo "missing argument"
elif [[ $VAR = "" ]] ;then
	echo "/"
else
	echo "${VAR##*/}"
fi

#!/bin/bash
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

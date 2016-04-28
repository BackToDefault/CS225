#!/bin/bash

shopt -s extglob

INPUT=$1
VAR=${INPUT%%+(/)}

if [[ $VAR = "" ]] ;then
	echo "$INPUT"
else
	echo "${VAR##*/}"
fi

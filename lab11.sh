#!/bin/bash

#Andrew Gordon
#CS225 
#Lab 11

#Objective: Start building a function library 
#Pre-req: copy /var/share/CS225/timefiles.tar.gz to your home directory and extract it

#Create a script that:
#-looks at the modified timestamp of each file in timefiles
#-creates a directory structure for the month and day in your home directory
#-copies each file to the appropriate directory
#-moves each file to the appropriate directory if -f (force) is set

#Script has to include the following:
#-syntax/help function
#-getopts options 
#-trap for control-c
#-function library for generic functions (check timestamp, create directory, print syntax etc..)
#-uses pattern substitution

source ~/Projects/CS225/functionlibrary.sh
trap "echo	You have been trapped" SIGINT
LAB11=${0##*/}
FORCE=""
TIMEDIR=~/timefiles/*

while getopts :hf opt ;do
  case $opt in
    h) echo "Command that copies timefiles to the home directory. A file system is created and used based on timestamps. (EXAMPLE: /your/home/directory/MONTH/DAY/file.txt)"
       echo "Usage $LAB11 <OPTION>"
       echo "-f move files instead of copy"
             exit 1 ;; 
    f) FORCE=MOVE ;;
    \?) echo "ERROR: Unknown Option. Try $LAB11 -h for assistance."
        exit 1 ;;
  esac
done
shift $((OPTIND-1))

for FILE in $TIMEDIR ;do
  Timestamp ${FILE}
  DEST=${HOME}/${MONTH}/${DAY}
  Directory ${DEST}
  if [ ! -z $FORCE ] ;then
    Move ${FILE} ${DEST}
  else
    Copy ${FILE} ${DEST}
  fi
done

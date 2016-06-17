#!/bin/bash
#Lab 9
#Andrew Gordon

while getopts :h:l:d:n:v opt ;do
  case $opt in
    # debugging  
    d) set -x ;;
    # set verbose to true
    v) VERBOSE=true ;;
    # help
    h) echo  "
             Usage: ${0##/*} <OPTION> <NAME>
             Script that parses command line arguments and options
             d: turn debugging on
             v: verbose
             n: set name as argument
             l: list directory
             " ;; 
    # argument name
    n) NAME=$OPTARG ;;
    # list directory
    l) LIST=$OPTARG 
       echo "Would you like to list directory? (Y/n)" 
       read CHOICE;;
    # error for non-option
    \?) echo "ERROR: Unknown Option" ;;
  esac
done

shift $((OPTIND-1))

if [[ ! -z "$LIST" ]] && [[ $CHOICE = "Y" ]] ;then
     if [[ ! -z "$VERBOSE" ]] ;then
          ls -l $LIST
     else
          ls $LIST
     fi
fi

#!/bin/bash
source /root/Projects/CS225/functions.lab13
trap '' SIGINT

while getopts :1234 opt ;do
  case $opt in
    1) do=1 ;;
    2) do=2 ;;
    3) do=3 ;;
    4) do=4 ;;
    \?) echo "ERROR: Unknown Option. Try $LAB12 -h for assistance."
        exit 1 ;;
  esac
done
shift $((OPTIND-1))
if [[ "$do" = "1" ]] ;then
     TestIP=$1
     check_ip $TestIP
     if [[ $Valid = 1 ]] ;then
       echo "IP valid"
     else
       echo "IP not valid"
     fi
fi

if [[ "$do" = "2" ]] ;then
     TestSSN=$1
     check_ssn $TestSSN
     if [[ $Valid = 1 ]] ;then
       echo "SSN valid"
     else
       echo "SSN not valid"
     fi
fi

if [[ "$do" = "3" ]] ;then
     TestPN=$1
     check_pn $TestPN
     if [[ $Valid = 1 ]] ;then
       echo "Phone number valid"
     else
       echo "Phone number not valid"
     fi
fi

if [[ "$do" = "4" ]] ;then
     TestCCN=$1
     check_ccn $TestCCN
     if [[ $Valid = 1 ]] ;then
       echo "Credit card number valid"
     else
       echo "Credit card number not valid"
     fi
fi

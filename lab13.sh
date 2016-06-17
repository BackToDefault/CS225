#!/bin/bash
#Andrew Gordon
#CS225
#Lab 13
#6/7/2016

#Objective: Create a script with four functions using BASH's in process regular expressions to check 
#the validity of Social Security numbers, telephone numbers, IP addresses and credit card numbers based on each particular data format.
# Take a piece of data as an argument and echo back it's type based on the results of these functions.
# Each function will be named check_ip, check_ssn, check_pn and check_ccn.
# Each function will take one argument - the data in question
# Each function will return a message and a 1 or 0 depending on the outcome of the comparison
# Make sure the script traps control-c and exits
# Make sure the script prints out help if no argument is given

source /root/Projects/CS225/functions.lab13
trap '' SIGINT

if [[ -z $1 ]] ;then
  echo "Argument input needed."
  echo "${0##*/} INPUT"
  echo "Input will be determined as IP, SSN, PN, or CCN."
  echo "    FORMAT:             BOTTOM RANGE:       TOP RANGE:"
  echo "IP: ###.###.###.###     0.0.0.0             255.255.255.255"
  echo "SSN ###-##-####         000-00-0000         999-99-9999"
  echo "PN  ###-###-####        000-000-0000        999-999-9999"
  echo "CCN ####-####-####-#### 0000-0000-0000-0000 9999-9999-9999-9999"
  exit 1;
fi

INPUT=$1
if check_ip $INPUT ;then 
  echo "$INPUT is a IP."
fi
if check_ssn $INPUT ;then
  echo "$INPUT is a SSN."
fi
if check_pn $INPUT ;then
  echo "$INPUT is a PN."
fi
if check_ccn ;then
  echo "$INPUT is a CCN."
fi

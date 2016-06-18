#!/bin/bash
#Andrew Gordon
#Lab 10

FLIST=$(find / -type f)
OSTEMP=$(mktemp)

cleanup()
{
	rm -f $OSTEMP
	exit 1
}

for LINE in $FLIST ;do
	((COUNT++))
	FILE=${LINE##*/}
	echo "File $COUNT: $FILE" >> $OSTEMP
done

echo "$COUNT files in the entire OS. Would you like to view the list? (y/n)"
read VIEW

if [[ $V = "y" ]] ;then
	less $OSTEMP
fi

echo "Save list in your home directory? (y/n)"
read S
if [[ $S = "y" ]] ;then
	cat $OSTEMP > /$HOME/OSFILES.txt
fi

trap cleanup SIGINT

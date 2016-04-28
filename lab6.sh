#!/bin/bash
XML=$( grep -q "filename" ~/medialab/media.xml | cut -f2 -d ">" | cut -f1 -d "<" )
IFS=$'\n'
LAB=$( ls -x1 ~/medialab/ )

echo "medialab files not in media.xml:"
for LABFILE in $LAB ;do
	if ( grep -q $LABFILE $XML ) ;then
		continue
	else
		echo "$LABFILE" && LABCOUNT=$(( $MEDIACOUNT + 1 ))
		continue
	fi
done
echo "There were $LABCOUNT file(s) not found in media.xml"


#echo "media.xml files not in medialab:"
#for XMLFILE in $XML ;do
#	if ( ls ~/medialab | grep -q "$XMLFILE" ) ;then
#		continue
#	else
#		echo "$XMLFILE"
#		XMLCOUNT=$(( $XMLCOUNT + 1 ))
#	fi
#done
#echo "There were $XMLCOUNT file(s) not found in medialab"

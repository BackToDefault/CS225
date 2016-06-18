#!/bin/bash
TEMP=$(mktemp)
ls -l1 ~/timefiles >> $TEMP

LINE=$(tail -n -1 $TEMP)

for FILE in PERM LINKS OWNER GROUP SIZE MONTH DAY FILE ;do
        eval ${FILE}='"${LINE%%\ *}"'
        LINE=${LINE#* }
done

echo $PERM
echo $MONTH
echo $DAY

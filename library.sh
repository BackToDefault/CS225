#!/bin/bash

EXIF()
{
CMake=$(exiv2 "$FILE" | grep -a "make" | cut -f2 -d ":")
CMake=${CMake# }
CMake=${CMake// /-}
CModel=$(exiv2 "$FILE" | grep -a "model" | cut -f2 -d ":")
CModel=${CModel# }
CModel=${CModel// /-}
Year=$(exiv2 "$FILE" | grep -a "timestamp" | cut -f2 -d ":")
Year=${Year# }
Month=$(exiv2 "$FILE" | grep -a "timestamp" | cut -f3 -d ":")
DayAndHour=$(exiv2 "$FILE" | grep -a "timestamp" | cut -f4 -d ":")
Day=${DayAndHour%% *}
Hour=${DayAndHour#* }
Minute=$(exiv2 "$FILE" | grep -a "timestamp" | cut -f5 -d ":")
Second=$(exiv2 "$FILE" | grep -a "timestamp" | cut -f6 -d ":")
if [[ "$FILE" == *.JPG ]] ;then
  Filetype="jpg"
else
  Filetype=${FILE#*.}
fi
if [[ "$CModel" =~ "$CMake" ]] ;then
        Camera="$CModel"
else
        Camera="$CMake-$CModel"
fi

FileName="$Year"-"$Month"-"$Day"_"$Hour"-"$Minute"-"$Second"_"$Camera".$Filetype
}


Directory()
{
Destination="$HOME/$Year/$Month/$Day"
mkdir -p $Destination
DEST=$Destination/$FileName
}

Hash()
{
md5=$(md5sum $FILE)
Hashes=$(mktemp $HOME/hashes.XXXXXX)
if [[ ! grep $Hashes $md5 ]] && [[ -e $DEST ]] ;then
  (( Postfix ++ ))
  FileName="$Year"-"$Month"-"$Day"_"$Hour"-"$Minute"-"$Second"_"$Camera"-"$Postfix".$Filetype
  DEST=$Destination/$FileName
  echo "$md5" >> $Hashes
else
  Duplicate=1
fi
}

Doing()
{
if [[ ! -z "$FORCE" ]] ;then
  mv $FILE $DEST
  echo "Moved $Sort of $FileCount - $FILE to $DEST"
else
  cp $FILE $DEST
  echo "Copied $Sort of $FileCount - $FILE to $DEST"
fi
}

Summary()
{
if [[ ! -z "$FORCE" ]] ;then
  THING="moved"
else
  THING="copied"
fi
echo "$PicCount JPEGs $THING"
echo "$MovCount videos $THING"
}

TIME()
{
Camera="UNKNOWN"
Year=$(date +%Y -r $FILE)
Month=$(date +%m -r $FILE)
Day=$(date +%d -r $FILE)
Hour=$(date +%H -r $FILE)
Minute=$(date +%M -r $FILE)
Second=$(date +%S -r $FILE)
Filetype=${FILE#*.}
FileName="$Year"-"$Month"-"$Day"_"$Hour"-"$Minute"-"$Second"_"$Camera".$Filetype
}

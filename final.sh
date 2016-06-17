#!/bin/bash
source /root/Projects/CS225/library.sh

#trap cleanup INT TERM

while getopts :fd opt ;do
  case $opt in
    f) FORCE=1 ;;
    d) set -x ;;
    \?) echo "ERROR: Unknown Option. Try -h for assistance."
        exit 1 ;;
  esac
done
shift $((OPTIND-1))
SRCE=$1/*

for FILE in $SRCE ;do
  (( FileCount ++ ))
done

source /root/Projects/CS225/library.sh
for FILE in $SRCE ;do
  if [[ "$FILE" == *.JPG ]] ;then
    EXIF ${FILE}
  else
    TIME ${FILE}
  fi
  Directory ${FILE}
#  Hash ${FILE} $DEST $Year $Month $Day $Hour $Minute $Second $Camera $Filetype
  (( Sort ++ ))
  if [[ "$DEST" == *.jpg ]] ;then
    (( PicCount ++ ))
  else
    (( MovCount ++ ))
  fi
  if [[ -e $DEST ]] ;then
    Doing $DEST $FileCount $Sort $FORCE
  else
    Hash ${FILE} $DEST $Year $Month $Day $Hour $Minute $Second $Camera $Filetype
  fi
done

Summary $PicCount $MovMount

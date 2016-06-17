#!/bin/bash
source /root/Projects/CS225/library.sh
trap Error INT TERM
trap cleanup INT TERM
Install

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
PicCount=0
MovCount=0
PicDup=0
MovDup=0
Sort=0
FileCount=0
Hashes=$(mktemp $HOME/hashes.XXXXXX)

for FILE in $SRCE ;do
  (( FileCount ++ ))
done

if [[ $(find $1 -maxdepth 0 -type d -empty 2>/dev/null) ]] ;then
    echo "Directory empty"
    cleanup
fi

for FILE in $SRCE ;do
  if [[ "$FILE" == *.JPG ]] ;then
    EXIF ${FILE}
  else
    TIME ${FILE}
  fi
  Directory ${FILE}
  (( Sort ++ ))
  if [[ ! -e $DEST ]] ;then
    Doing
  else
    Hash
    if [[ "$Duplicate" -ne 1 ]] ;then
      Doing
    fi
  fi
Duplicate=""
done
Summary
cleanup

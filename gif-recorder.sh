#!/bin/bash

DATE=`date +%Y%m%d%H%M%S`

DEFAULT_DURATION=10

echo -ne "Select area which will be recorded"

AREA="$(xrectsel)"
IFS=+ read DIM X Y <<< $AREA
IFS=x read W H <<< $DIM

echo ""

read -p "Enter recording duration in seconds: " USERDUR

# Duration and output file
if [ $USERDUR -gt 0 ]; then
    DURATION=$USERDUR
else
    DURATION=$DEFDUR
fi

echo "Recording has started..."

byzanz-record --duration=$DURATION --x=$X --y=$Y --width=$W --height=$H ~/Pictures/out${DATE}.gif

echo "Recording has ended."

eog ~/Pictures/out${DATE}.gif

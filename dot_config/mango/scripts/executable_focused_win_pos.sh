#!/bin/sh

FOCUSED_OUTPUT=$(mmsg -go | grep 'selmon 1' | awk '{ printf $1 }')
COORDINATES=$(mmsg -gx | grep "$FOCUSED_OUTPUT")
X=$(echo "$COORDINATES" | grep x | awk '{ printf $3}')
Y=$(echo "$COORDINATES" | grep y | awk '{ printf $3}')
WIDTH=$(echo "$COORDINATES" | grep width | awk '{ printf $3}')
HEIGHT=$(echo "$COORDINATES" | grep height | awk '{ printf $3}')

printf "%s,%s %sx%s" $X $Y $WIDTH $HEIGHT

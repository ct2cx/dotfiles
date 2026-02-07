#!/bin/sh

FILENAME=grimshot-$(date "+%d-%b-%Y-%s%N")
OUTPUT_LOC=~/Pictures/Screenshots/"$FILENAME".png
FOCUSED_OUTPUT=$(mmsg -go | grep 'selmon 1' | awk '{ printf $1 }')
FOCUSED_WIN=$(~/.config/mango/scripts/focused_win_pos.sh)

FULL=
AREA=
WIN=
SAVE=
COPY=
SAVECOPY=

while [ "$#" -gt 0 ]; do
	case $1 in
		-f)
			FULL=1
			shift
			;;
		-a)
			AREA=1
			shift
			;;
		-w)
			WIN=1
			shift
			;;
		--save)
			SAVE=1
			shift
			;;
		--copy)
			COPY=1
			shift
			;;
		--savecopy)
			SAVECOPY=1
			shift
			;;
		*)
			echo Unknown flag: $1
			exit 1
			;;
	esac
done

if [ ! $FULL ] && [ ! $WIN ] && [ ! $AREA ]; then
	echo Please provide an option, -f/-w/-a.
	exit 1
fi

if [ ! $SAVE ] && [ ! $COPY ] && [ ! $SAVECOPY ]; then
	echo Please provide an option, --save/--copy/--savecopy.
	exit 1
fi


notifyCopied() {
	notify-send -a grim 'Screenshot copied' 'Screenshot has been copied to clipboard'
}

notifySavedCopied() {
	notify-send -i "$OUTPUT_LOC" -a grim 'Screenshot captured' 'Screenshot has been saved and copied to clipboard'
}

notifySaved() {
	notify-send -i "$OUTPUT_LOC" -a grim 'Screenshot saved' "Screenshot has been saved to $OUTPUT_LOC"
}

saveScreenshot() {
	if [ $FULL ]; then
		grim -t png -o "$FOCUSED_OUTPUT" "$OUTPUT_LOC"
	elif [ $WIN ]; then
		grim -t png -g "$FOCUSED_WIN" "$OUTPUT_LOC"
	elif [ $AREA ]; then
		grim -t png -g "$(slurp)" "$OUTPUT_LOC"
	fi
}

copyScreenshot() {
	if [ $FULL ]; then
		grim -t png -o "$FOCUSED_OUTPUT" - | wl-copy -t image/png
	elif [ $WIN ]; then
		grim -t png -g "$FOCUSED_WIN" - | wl-copy -t image/png
	elif [ $AREA ]; then
		grim -t png -g "$(slurp)" - | wl-copy -t image/png
	fi
}

saveCopyScreenshot() {
	if [ $FULL ]; then
		grim -t png -o "$FOCUSED_OUTPUT" - | wl-copy -t image/png
		wl-paste > "$OUTPUT_LOC"
	elif [ $WIN ]; then
		grim -t png -g "$FOCUSED_WIN" - | wl-copy -t image/png
		wl-paste > "$OUTPUT_LOC"
	elif [ $AREA ]; then
		grim -t png -g "$(slurp)" - | wl-copy -t image/png
		wl-paste > "$OUTPUT_LOC"
	fi
}

notifyErr() {
	notify-send -a grim 'Failed to take screenshot'
}

if [ $SAVE ]; then
	saveScreenshot
	if [ $? -ne 0]; then
		notifyErr
	else
		notifySaved
	fi
elif [ $COPY ]; then
	copyScreenshot
	if [ $? -ne 0 ]; then
		notifyErr
	else
		notifyCopied
	fi
elif [ $SAVECOPY ]; then
	saveCopyScreenshot
	if [ $? -ne 0 ]; then
		notifyErr
	else
		notifySavedCopied
	fi
fi

convert_xmb_assets()
{
	SRC_DIR="$1"
	DST_DIR="$2"
	SCALE_ICON=$3
	SCALE_BG=$4
	# Dots per inch; a value of 90 seems to produce
	# a 64x64 resolution for most icons
	DENSITY=90

	mkdir -p "$DST_DIR"

	IFS_old=$IFS
	IFS=$(echo -en "\n\b")

	for THEME in $(ls $SRC_DIR)
	do
		if [ -d "$SRC_DIR/$THEME" ]
		then
			THEME="$(basename "$THEME")"
			mkdir -p "$DST_DIR/$THEME/png"

			cp $SRC_DIR/$THEME/*.ttf $DST_DIR/$THEME/

			for PNG in $(ls -d "$SRC_DIR/$THEME/png/"*.png)
			do
				NAME="$(basename "$PNG" .png)"
				SRC_FILE="$SRC_DIR/$THEME/src/$NAME.svg"
				IS_SVG=1

				if [ ! -e $SRC_FILE ]
				then
					SRC_FILE="$SRC_DIR/$THEME/png/$NAME.png"
					IS_SVG=
				fi

				DST_FILE="$DST_DIR/$THEME/png/$NAME.png"

				if [ ! -e $DST_FILE ] || [ $SRC_FILE -nt $DST_FILE ]
				then
					SCALE_FACTOR=$SCALE_ICON
					if [ $NAME = "bg" ]
					then
						SCALE_FACTOR=$SCALE_BG
					fi

					if [ $IS_SVG ]
					then
						convert -background 'rgb(255,255,255)' -alpha Background -DENSITY $DENSITY "$SRC_FILE" -resize $SCALE_FACTOR "$DST_FILE"
					else
						convert -background 'rgb(255,255,255)' -alpha Background "$SRC_FILE" -resize $SCALE_FACTOR "$DST_FILE"
					fi
					optipng -quiet -o7 -strip all "$DST_FILE"

				fi
			done
		fi
	done

	IFS=$IFS_old
}

# ctr:
# - SCALE_ICON: 32x32!
# - SCALE_BG: 400x240!
#
# Vita:
# - SCALE_ICON: 64x64!
# - SCALE_BG: 960x544!
#
# convert_xmb_assets SRC_DIR DST_DIR SCALE_ICON SCALE_BG

if [ "$#" -ne 4 ] || [ ! -d "$1" ]
then
	echo "Usage: $0 SRC_DIR DST_DIR SCALE_ICON SCALE_BG"
	exit 1
fi

convert_xmb_assets "$1" "$2" $3 $4

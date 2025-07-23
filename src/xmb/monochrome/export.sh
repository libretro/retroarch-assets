#!/usr/bin/env bash

exitFlag=0
checkCommand() {
	if ! command -v "${1}" >/dev/null; then
		echo "${1} not installed!"
		exitFlag=1
	fi
}
checkCommand 'inkscape'
checkCommand 'magick'
checkCommand 'oxipng'
if [[ ${exitFlag} -eq 1 ]]; then
	exit 1
fi

for src in *.svg; do
	echo $src;
	export dest=$(echo $src | sed "s/.svg/.png/")
	mkdir -p ../../../xmb/monochrome/png
	inkscape -z -C -w 256 -h 256 -f "$src" -e "../../../xmb/monochrome/png/$dest"
	magick mogrify -background 'rgb(255,255,255)' -alpha Background "../../../xmb/monochrome/png/$dest"
	oxipng --quiet --zopfli --opt max --strip all "../../../xmb/monochrome/png/$dest"
	#rsvg-convert -b none -w 256 -h 256 "$src" -o "../png/$dest"
	#convert -density 360 -background none "$src" "../png/$dest"
	#convert "../png/$dest" -write mpr:temp -background black -alpha Remove mpr:temp -compose Copy_Opacity -composite "../png/$dest"
	#python2 ../../NPMApng2PMApng.py "../png/$dest" "../png/$dest"
done

#!/bin/sh

# Icon Theme Inverter
#
# Builds out monochrome-inverted.

mkdir -p ../../xmb/monochrome-inverted/png
for filename in ../../xmb/monochrome/png/*.png; do
	basename="$(basename "$filename" .png)"
	echo $filename
	echo $basename
	convert "../../xmb/monochrome/png/$basename.png" -negate "../../xmb/monochrome-inverted/png/$basename.png"
done
cp ../../xmb/monochrome/font.ttf ../../xmb/monochrome-inverted/font.ttf

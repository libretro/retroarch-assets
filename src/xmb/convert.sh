#!/bin/sh

# MonoChrome SVG to PNG Converter
#
# Will update the given icon from its SVG to its PNG.
#
# Requires Inkscape to be installed.
#
# ./convert.sh THEME ICON
#
# Parameters
# - THEME (optional)   Which theme to act on.
# - ICON (optional)    Which icon to conver from an SVG to a PNG.
#
# If the parameters are not provided, it will process all images.
#
# Example
#
#     ./convert.sh monochrome battery-full
#     ./convert.sh flatui DOS
#     ./convert.sh

if [ -z "$1" ]; then
	for theme in $(find . -type d -not -path . -printf "%f\n"); do
		for image in $theme/*.svg; do
			./convert.sh $theme "$(basename "$image" .svg)"
		done
	done
else
	inkscape -z -e "../../xmb/$1/png/$2.png" -w 512 -h 512 "$1/$2.svg"
fi;
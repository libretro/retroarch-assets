#!/usr/bin/env bash

# MonoChrome SVG to PNG Converter
#
# Will update the given icon from its SVG to its PNG.
#
# Requires Inkscape to be installed.
#
# ./convert.sh THEME ICON
#
# Parameters
# - THEME   Which theme to act on.
# - ICON    Which icon to conver from an SVG to a PNG.
#
# Example
#
#     ./convert.sh monochrome battery-full
#     ./convert.sh flatui DOS

exitFlag=0
checkCommand() {
	if ! command -v "${1}" >/dev/null; then
		echo "${1} not installed!"
		exitFlag=1
	fi
}
checkCommand 'inkscape'
checkCommand 'oxipng'
if [[ ${exitFlag} -eq 1 ]]; then
	exit 1
fi

cd -- "$(cd -- "$(dirname -- "$0")" && pwd -P)"

inkscape -z -e "$1/png/$2.png" -w 256 -h 256 "../src/xmb/$1/$2.svg"
oxipng --quiet --zopfli --opt max --strip all "$1/png/$2.png"

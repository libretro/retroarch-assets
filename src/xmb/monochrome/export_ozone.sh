for src in *.svg; do
	echo $src;
	export dest=`echo $src | sed "s/.svg/.png/"`
	mkdir -p ../../../ozone/png/icons
	inkscape -z -C -w 46 -h 46 -f "$src" -e "../../../ozone/png/icons/$dest"
	convert "../../../ozone/png/icons/$dest" \( -clone 0 -fill "#FFFFFF" -draw "color 0,0 reset" \) -compose atop -composite "../../../ozone/png/icons/$dest"
	optipng -o7 -strip all "../../../ozone/png/icons/$dest"
done

# Override some icons (different size and color)
src="clock.svg"
export dest=`echo $src | sed "s/.svg/.png/"`
mkdir -p ../../../ozone/png/icons
inkscape -z -C -w 92 -h 92 -f "$src" -e "../../../ozone/png/icons/$dest"
convert "../../../ozone/png/icons/$dest" \( -clone 0 -fill "#FFFFFF" -draw "color 0,0 reset" \) -compose atop -composite "../../../ozone/png/icons/$dest"
optipng -o7 -strip all "../../../ozone/png/icons/$dest"

for src in battery-*.svg; do
        export dest=`echo $src | sed "s/.svg/.png/"`
        mkdir -p ../../../ozone/png/icons
        inkscape -z -C -w 92 -h 92 -f "$src" -e "../../../ozone/png/icons/$dest"
        convert "../../../ozone/png/icons/$dest" \( -clone 0 -fill "#FFFFFF" -draw "color 0,0 reset" \) -compose atop -composite "../../../ozone/png/icons/$dest"
        optipng -o7 -strip all "../../../ozone/png/icons/$dest"
done

src="dialog-slice.svg"
export dest=`echo $src | sed "s/.svg/.png/"`
mkdir -p ../../../ozone/png/icons
inkscape -z -C -w 256 -h 256 -f "$src" -e "../../../ozone/png/icons/$dest"
convert "../../../ozone/png/icons/$dest" \( -clone 0 -fill "#FFFFFF" -draw "color 0,0 reset" \) -compose atop -composite "../../../ozone/png/icons/$dest"
optipng -o7 -strip all "../../../ozone/png/icons/$dest"

src="key-hover.svg"
export dest=`echo $src | sed "s/.svg/.png/"`
mkdir -p ../../../ozone/png/icons
inkscape -z -C -w 256 -h 256 -f "$src" -e "../../../ozone/png/icons/$dest"
optipng -o7 -strip all "../../../ozone/png/icons/$dest"

src="key.svg"
export dest=`echo $src | sed "s/.svg/.png/"`
mkdir -p ../../../ozone/png/icons
inkscape -z -C -w 256 -h 256 -f "$src" -e "../../../ozone/png/icons/$dest"
optipng -o7 -strip all "../../../ozone/png/icons/$dest"

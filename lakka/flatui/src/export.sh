for dim in 64 128 192 256; do
	for src in *.svg; do
		echo $src;
		export dest=`echo $src | sed "s/.svg/.png/"`
		inkscape -z -C -w $dim -h $dim -f "$src" -e "../$dim/$dest"
	done
done

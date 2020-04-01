for src in *.svg
do
   fletter="$(echo $src | head -c 1)"

   # Sidebar console tabs should be 40x40 (start with uppercase and doesn't end with -content)
   # others should be 46x46

   case $src in
      *-content.svg)
         size="46"
         ;;
      *)
         if [[ "$fletter" == "${fletter,,}" ]]
         then
            size="46"
         else
            size="40"
         fi
         ;;
   esac

	echo "Exporting $src ($size x $size)"

   export dest=`echo $src | sed "s/.svg/.png/"`
   mkdir -p ../../../ozone/png/icons
   inkscape -z -C -w $size -h $size -f "$src" -e "../../../ozone/png/icons/$dest"
   magick mogrify -background 'rgb(255,255,255)' -alpha Background "../../../ozone/png/icons/$dest"
   optipng -o7 -strip all "../../../ozone/png/icons/$dest"
done

# Override some icons (different size and color)
src="clock.svg"
export dest=`echo $src | sed "s/.svg/.png/"`
mkdir -p ../../../ozone/png/icons
inkscape -z -C -w 92 -h 92 -f "$src" -e "../../../ozone/png/icons/$dest"
magick mogrify -background 'rgb(255,255,255)' -alpha Background "../../../ozone/png/icons/$dest"
optipng -o7 -strip all "../../../ozone/png/icons/$dest"

for src in battery-*.svg; do
   export dest=`echo $src | sed "s/.svg/.png/"`
   mkdir -p ../../../ozone/png/icons
   inkscape -z -C -w 92 -h 92 -f "$src" -e "../../../ozone/png/icons/$dest"
   magick mogrify -background 'rgb(255,255,255)' -alpha Background "../../../ozone/png/icons/$dest"
   optipng -o7 -strip all "../../../ozone/png/icons/$dest"
done

src="dialog-slice.svg"
export dest=`echo $src | sed "s/.svg/.png/"`
mkdir -p ../../../ozone/png/icons
inkscape -z -C -w 256 -h 256 -f "$src" -e "../../../ozone/png/icons/$dest"
magick mogrify -background 'rgb(255,255,255)' -alpha Background "../../../ozone/png/icons/$dest"
optipng -o7 -strip all "../../../ozone/png/icons/$dest"

src="key-hover.svg"
export dest=`echo $src | sed "s/.svg/.png/"`
mkdir -p ../../../ozone/png/icons
inkscape -z -C -w 256 -h 256 -f "$src" -e "../../../ozone/png/icons/$dest"
magick mogrify -background 'rgb(255,255,255)' -alpha Background "../../../ozone/png/icons/$dest"
optipng -o7 -strip all "../../../ozone/png/icons/$dest"

src="key.svg"
export dest=`echo $src | sed "s/.svg/.png/"`
mkdir -p ../../../ozone/png/icons
inkscape -z -C -w 256 -h 256 -f "$src" -e "../../../ozone/png/icons/$dest"
magick mogrify -background 'rgb(255,255,255)' -alpha Background "../../../ozone/png/icons/$dest"
optipng -o7 -strip all "../../../ozone/png/icons/$dest"

# Export auxiliary sidebar icons
SIDEBAR_SRC[0]="add.svg"            # add.png
SIDEBAR_SRC[1]="add-favorite.svg"   # favorites.png
SIDEBAR_SRC[2]="history.svg"        # history.png
SIDEBAR_SRC[3]="image.svg"          # image.png
SIDEBAR_SRC[4]="music.svg"          # music.png
SIDEBAR_SRC[5]="menu_quickmenu.svg" # retroarch.png
SIDEBAR_SRC[6]="setting.svg"        # settings.png
SIDEBAR_SRC[7]="menu_video.svg"     # video.png

# > Some icons are sourced from other themes...
SIDEBAR_SRC_DIR[0]=""           # add.png
SIDEBAR_SRC_DIR[1]=""           # favorites.png
SIDEBAR_SRC_DIR[2]="../flatui/" # history.png
SIDEBAR_SRC_DIR[3]=""           # image.png
SIDEBAR_SRC_DIR[4]=""           # music.png
SIDEBAR_SRC_DIR[5]=""           # retroarch.png
SIDEBAR_SRC_DIR[6]="../flatui/" # settings.png
SIDEBAR_SRC_DIR[7]=""           # video.png

SIDEBAR_DST[0]="add.png"
SIDEBAR_DST[1]="favorites.png"
SIDEBAR_DST[2]="history.png"
SIDEBAR_DST[3]="image.png"
SIDEBAR_DST[4]="music.png"
SIDEBAR_DST[5]="retroarch.png"
SIDEBAR_DST[6]="settings.png"
SIDEBAR_DST[7]="video.png"

SIDEBAR_DST_SIZE[0]=58 # add.png
SIDEBAR_DST_SIZE[1]=70 # favorites.png
SIDEBAR_DST_SIZE[2]=48 # history.png
SIDEBAR_DST_SIZE[3]=64 # image.png
SIDEBAR_DST_SIZE[4]=64 # music.png
SIDEBAR_DST_SIZE[5]=76 # retroarch.png
SIDEBAR_DST_SIZE[6]=76 # settings.png
SIDEBAR_DST_SIZE[7]=64 # video.png

SIDEBAR_DST_BORDER[0]=3  # add.png
SIDEBAR_DST_BORDER[1]=-3 # favorites.png
SIDEBAR_DST_BORDER[2]=8  # history.png
SIDEBAR_DST_BORDER[3]=0  # image.png
SIDEBAR_DST_BORDER[4]=0  # music.png
SIDEBAR_DST_BORDER[5]=-6 # retroarch.png
SIDEBAR_DST_BORDER[6]=-6 # settings.png
SIDEBAR_DST_BORDER[7]=0  # video.png

mkdir -p ../../../ozone/png/sidebar

for INDEX in $(seq 0 $((${#SIDEBAR_SRC[@]} - 1)))
do

   src_dir="${SIDEBAR_SRC_DIR[INDEX]}"
   src="${src_dir}${SIDEBAR_SRC[INDEX]}"
   dest="${SIDEBAR_DST[INDEX]}"
   size=${SIDEBAR_DST_SIZE[INDEX]}
   border_size=${SIDEBAR_DST_BORDER[INDEX]}

   inkscape -z -C -w $size -h $size -f "$src" -e "../../../ozone/png/sidebar/$dest"

   # flatui icons are coloured - change to monochrome
   if [[ $src_dir == "../flatui/" ]]
   then
      # mogrify crashes with this command on my system,
      # so have to use convert...
      temp_file="${dest}.tmp.png"
      magick convert "../../../ozone/png/sidebar/$dest" xc:"#ffffff" -channel RGB -clut "../../../ozone/png/sidebar/$temp_file"
      mv "../../../ozone/png/sidebar/$temp_file" "../../../ozone/png/sidebar/$dest"
   fi

   # Add or remove a border, if required
   if [[ $border_size -gt 0 ]]
   then
      magick mogrify -bordercolor transparent -border $border_size "../../../ozone/png/sidebar/$dest"
   elif [[ $border_size -lt 0 ]]
   then
      border_size=$(($border_size * -1))
      magick mogrify -shave $border_size "../../../ozone/png/sidebar/$dest"
   fi

   magick mogrify -background 'rgb(255,255,255)' -alpha Background "../../../ozone/png/sidebar/$dest"
   optipng -o7 -strip all "../../../ozone/png/sidebar/$dest"

done

# > Special case: netplay icon has no src - it
#   exists only as a png file in the XMB pixel theme
src="../../../xmb/pixel/png/room.png"
dest="netplay.png"

magick convert "$src" xc:"#ffffff" -channel RGB -clut "../../../ozone/png/sidebar/$dest"
magick mogrify -resize 64x64 "../../../ozone/png/sidebar/$dest"
magick mogrify -background 'rgb(255,255,255)' -alpha Background "../../../ozone/png/sidebar/$dest"
optipng -o7 -strip all "../../../ozone/png/sidebar/$dest"

# Export main RetroArch icon
src="menu_quickmenu.svg"
dest="retroarch.png"

size=118
border_size=11

inkscape -z -C -w $size -h $size -f "$src" -e "../../../ozone/png/$dest"
magick mogrify -shave $border_size "../../../ozone/png/$dest"
magick mogrify -background 'rgb(255,255,255)' -alpha Background "../../../ozone/png/$dest"
optipng -o7 -strip all "../../../ozone/png/$dest"

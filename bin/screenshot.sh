#!/bin/sh

img_dir="$HOME/Images"
FILE=$img_dir/$(date +'%Y-%m-%d-%H%M%S_grim.png')

function sc {
		slurp | grim -g - $FILE
		wl-copy < $FILE
}

if [ -e "$img_dir" ] && [ -d "$img_dir" ] 
then 
		sc
else 
		mkdir $img_dir
		sc
fi


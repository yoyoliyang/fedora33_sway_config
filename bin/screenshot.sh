#!/bin/sh

img_dir="$HOME/Images"
FILE=$img_dir/$(date +'%Y-%m-%d-%H%M%S_grim.png')

function sc {
		slurp | grim -g - $FILE
		wl-copy < $FILE
}

function msg {
		info="截图拷贝到了剪切板"
	   	swaynag --background 2e82bf -f Consolas,20 -m $info &
		sleep 2 
		kill `pidof swaynag`
}

if [ -e "$img_dir" ] && [ -d "$img_dir" ] 
then 
		sc
		msg
else 
		mkdir $img_dir
		sc
		msg
fi


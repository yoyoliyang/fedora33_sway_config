#!/bin/sh

#i3status官方方式扩展脚本，增加蓝牙连接图标

device='78:DA:07:B3:BC:A7'

i3status | while :
do
		read line
		if bluetoothctl info | grep -q $device
		then 
				icon=`echo -e '\u212c'`
		else
				icon=''
		fi
		echo "$line" $icon || exit 1
done

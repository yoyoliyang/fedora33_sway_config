#!/bin/sh

# 音量控制脚本，用pactl替代古老的amixer。
# 用法：
# ./volume_controller.sh up|down|toggle
# 2020-11-06

function mute() {
	sink=$1
	echo $sink
	pactl set-sink-mute $1 toggle
}

function up() {
		sink=$1
		pactl set-sink-volume $1 +5%
}

function down() {
		sink=$1
		pactl set-sink-volume $1 -5%
}

default_sink=`pactl info | grep "Default Sink:" | awk '{print $3}'`


case $1 in 
		"toggle" )mute $default_sink;;
		"up" ) up $default_sink;;
		"down" ) down $default_sink;;
		* ) echo "错误的命令参数";;
esac

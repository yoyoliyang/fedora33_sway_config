#!/bin/sh

# 连接方糖shell脚本
device="78:DA:07:B3:BC:A7"
info="蓝牙已连接"

function msg {
	   	swaynag --background 2e82bf -f Consolas,20 -m $info &
		sleep 2
		kill `pidof swaynag`
}

if bluetoothctl info | grep -q $device
then
		msg
else
		bluetoothctl connect $device
		msg
fi


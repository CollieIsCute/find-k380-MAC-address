#!/bin/bash

bluetoothctl scan on &>/dev/null &
echo finding bluetooth device...
sleep 1
target='K380'
mac=`bluetoothctl devices | grep $target | cut -d' ' -f2`
if [[ $mac == "" ]] ; then
	echo $target not found!
	exit 1
else
	echo "$target's mac address is $mac"
fi

kill $!
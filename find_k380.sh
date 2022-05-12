#!/bin/bash

bluetoothctl scan on &>/dev/null &
echo finding bluetooth device...
sleep 1
user_target=$@
target='K380'

if [[ $user_target != "" ]] ; then
	target=$user_target
fi
mac=`bluetoothctl devices | grep $target | cut -d' ' -f2`
if [[ $mac == "" ]] ; then
	echo $target not found!
	exit 1
else
	echo "$target's mac address:"
	echo "$mac"
fi

kill $!
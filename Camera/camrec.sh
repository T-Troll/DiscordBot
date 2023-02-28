#!/bin/sh
echo Running camera script...
DURL="https://discord.com/api/webhooks/1051492081752866996/b6buZtbagichY1gyy3l5Uja01OD4syyN3qU-7tyLGO8ql3kwU2eXnifn-v77W-CuX4u2"
FPATH=$1
echo Path is $FPATH
while [ 1 ]; do
	# check avaliability...
	while [[ ! -s $FPATH/ai.log ]]; do sleep 1; done
	fname="$FPATH/cam-`date '+%F-%H-%M-%S'`.h265"
	#echo Recording $fname...
	((/root/sen2discord.sh $DURL "Alarm - recording $fname")&)&
	while [[ -s $FPATH/ai.log ]]; do
		: > $FPATH/ai.log
		nc 10.0.7.5 55059 | dd conv=notrunc oflag=append iflag=fullblock ibs=512 obs=8192 count=65536 of="$fname" 2> /dev/null
		((/root/checkspace.sh $FPATH)&)&
	done
	echo Done recording
done

#!/bin/sh
echo Running camera script...
DURL="https://discord.com/api/webhooks/1051492081752866996/b6buZtbagichY1gyy3l5Uja01OD4syyN3qU-7tyLGO8ql3kwU2eXnifn-v77W-CuX4u2"
FPATH=$1
logger -t CAMREC "Starting recording for $FPATH"
echo Path is $FPATH
while [ 1 ]; do
	fname="$FPATH/cam-`date '+%F-%H-%M-%S'`.h265"
	WASDATA=0
	# start recording until data present
	while 
		timeout 30 netcat -w 5 10.0.7.5 55059 2> /dev/null | dd conv=notrunc oflag=append iflag=fullblock ibs=512 obs=8192 count=65536 of="$fname" 2> /dev/null
		[[ -f $FPATH/ai.log ]]
	do
		WASDATA=1
		rm $FPATH/ai.log
		((/root/checkspace.sh $FPATH)&)&
	done
	if [[ $WASDATA == 0 ]]; then
		rm $fname
		#echo No data in $fname, removing
	else
		#((/root/sen2discord.sh $DURL "Event recorded - $fname")&)&
		((/root/checkspace.sh $FPATH)&)&
		#echo Data in $fname, keeping
	fi
	#echo Done recording
done

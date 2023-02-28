#!/bin/sh
DURL="https://discord.com/api/webhooks/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
FPATH="/mnt/sda2/Camera"
STATE=1
COUNT=1
logger -t CAMCHECK "Running camera AI..."
if ! ps -e x | grep camrec | grep -q .sh; then
	((/root/camrec2.sh $FPATH)&)&
fi
while [ 1 ]; do
        # check avaliability....
	while ! netcat -z -n 10.0.7.5 55060; do
		if [ $COUNT == 0 ]; then
			logger -t CAMCHECK "Camera down"
			((/root/sen2discord.sh $DURL "Camera offline")&)&
		else
			COUNT=0
		fi
		STATE=0
		sleep 1
	done
	if [ $STATE == 0 ]; then
		logger -t CAMCHECK "Camera up"
		((/root/sen2discord.sh $DURL "Camera online")&)&
		STATE=1
	fi
	COUNT=1
	# open connection
	timeout 600 netcat -n 10.0.7.5 55060 | while grep -q -m1 -e alarm; do
			touch $FPATH/ai.log
        	done
	echo NetCat loop out
done

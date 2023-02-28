#!/bin/sh

STATE=1
DELAY=30
HOST=$1
NAME=$2
DURL="https://discordapp.com/api/webhooks/761453069996261376/N4aYzBIRhhp4khUxeQycLPRw7VIeV3B9J9pkXEqts35oPWyWskm2SzVx7QZK5jQpga1O"
logger -t CHECKBOT: "Started for $NAME at $HOST"
while [ true ]; do
    ping -c5 $HOST > /dev/null
    if [ $? == 1 ]; then
	if [ $STATE == 1 ]; then
	    logger -t CHECKBOT "$NAME down!"
	    echo host down
	    /root/sen2discord.sh $DURL "$NAME is DOWN!"
	    STATE=0
	fi
    else
	if [ $STATE == 0 ]; then
	    logger -t CHECKBOT "$NAME up!"
	    echo host up
	    /root/sen2discord.sh $DURL "$NAME is UP!"
	    STATE=1
	fi
    fi
    sleep $DELAY
done
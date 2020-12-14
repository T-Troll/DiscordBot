#!/bin/sh

STATE=1
DELAY=30
HOST="10.0.7.7"
MSGOFF="Host is DOWN!"
MSGON="Host is UP!"
DURL="https://discordapp.com/api/webhooks/761453069996261376/N4aYzBIRhhp4khUxeQycLPRw7VIeV3B9J9pkXEqts35oPWyWskm2SzVx7QZK5jQpga1O"

while [ true ]; do

FLAG=0

ping -c 1 $HOST > /dev/null

if [ $? == 1 ]; then
if [ $STATE == 1 ]; then
    MSG=$MSGOFF
    FLAG=1
    STATE=0
fi
else
if [ $STATE == 0 ]; then
    MSG=$MSGON
    FLAG=1
    STATE=1
fi
fi

if [ $FLAG == 1 ]; then
curl -s \
 -H "User-Agent: OpenWRTBot http://wayphone.net, v0.1)" \
 -H "Content-Type: application/json" \
 -d '{"tts":"false","content":"'"$MSG"'"}' \
 $DURL
fi

#echo "$STATE - $FLAG - $MSG"

sleep $DELAY

done
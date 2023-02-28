#!/bin/sh

curl -s \
 -H "User-Agent: OpenWRTBot http://wayphone.net, v0.1)" \
 -H "Content-Type: application/json" \
 -d '{"tts":"false","content":"'"$2"'"}' \
 $1
#logger -t DiscordBot $2

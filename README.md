# DiscordBot
Simple bot for host state monitoring and post state changes into Discord channel.

## How to use
- Copy checkbot.sh to you router (better in /root), chmod +x to allow execution.
- Generate Discord Webhook for the channel you plan to use for notifications (Channel properties (gear icon) - Integrations - Webhooks - New webhook - Copy webhook URL).
- Edit script - put webhook url into `DURL` variable, change host IP/name, define you messages in `MSGOFF`/`MSGON`, etc.
- Run. I reccoment autostart script then system start, it's not cron-based, but working all the time (to keep state).

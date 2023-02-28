# DiscordBot
Simple bot for host state monitoring and post state changes into Discord channel.  
Support for Hanet Smart camera backend added into `/camera` folder

## How to use
- Copy all .sh files into `/root`, chmod +x to allow execution.
- Generate Discord Webhook for the channel you plan to use for notifications (Channel properties (gear icon) - Integrations - Webhooks - New webhook - Copy webhook URL).
- Put webhook URL into `DURL` variable.
- Run `/root/checkbot.sh <host or IP> "<host name>"`. You can add this command to the startup script for automatic execution.
- For camera:
  - Edit `DURL`, IP and `FPATH` (path for store video) into `camcheck.sh`, `camrec.sh`, `camrec2.sh`
  - Edit recording script path into `camcheck.sh` - use `camrec.sh` in case you want to start recording after camera alarm, or `camrec2.sh` if you want continuous recording, but keep files after alarm (higher HDD usage, but more data).
  - Run `/root/camcheck.sh` or/and add to startup script.

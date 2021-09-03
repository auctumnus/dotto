#!/bin/sh
# dunst
python ~/.config/dunst/make-dunstrc.py
killall dunst
notify-send "restart dunst"

# i3
python ~/.i3/make-i3config.py
i3-msg reload

# firefox
pywalfox update

# discord
python ~/.config/BetterDiscord/make-bdtheme.py

echo "Successfully applied wal colors. Please update discord!"

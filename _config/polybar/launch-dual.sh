#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
polybar -c ~/.config/polybar/config.ini main >>/tmp/polybar1.log 2>&1 & disown
polybar -c ~/.config/polybar/config.ini secondary >> /tmp/polybar2.log 2>&1 & disown
echo "Bars launched (dual monitor mode)..."

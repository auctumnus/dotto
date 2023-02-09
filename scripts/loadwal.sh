#!/bin/sh

swaync-client -rs &
killall -SIGUSR2 waybar &
pywalfox update &


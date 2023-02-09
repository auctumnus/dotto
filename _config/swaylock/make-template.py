#!/usr/bin/env python
# Makes a dunstrc to match pywal colors.
import json
import os
import subprocess
wal_cache_colors_json = "/home/auctumnus/.cache/wal/colors.json"

colors = json.loads(open(wal_cache_colors_json, "r").read())

template = open("/home/auctumnus/.config/swaylock/template-config", "r").read()

theme = subprocess.run(['darkman', 'get'], capture_output=True).stdout.decode('UTF-8').strip()

template = template.replace("{theme}", theme)

template = template.replace("{foreground}", colors["special"]["foreground"])
template = template.replace("{background}", colors["special"]["background"])

for color in colors["colors"]:
    template = template.replace("{" + color + "}", colors["colors"][color])

dunstrc = open("/home/auctumnus/.config/swaylock/config", "w")
dunstrc.write(template)
dunstrc.close()


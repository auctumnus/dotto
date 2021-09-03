#!/usr/bin/env python
# Makes a dunstrc to match pywal colors.
import json
import os
wal_cache_colors_json = "/home/auctumnus/.cache/wal/colors.json"

colors = json.loads(open(wal_cache_colors_json, "r").read())

template = open("/home/auctumnus/.config/dunst/template-dunstrc", "r").read()

template = template.replace("{foreground}", colors["special"]["foreground"])
template = template.replace("{background}", colors["special"]["background"])

for color in colors["colors"]:
    template = template.replace("{" + color + "}", colors["colors"][color])

dunstrc = open("/home/auctumnus/.config/dunst/dunstrc", "w")
dunstrc.write(template)
dunstrc.close()


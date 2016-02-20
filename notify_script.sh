#!/bin/bash

# Script to send a notification about the current playing song
# Called from MOC's option "OnSongChange" and custom keyboard shortcut

/usr/bin/notify-send "`mocp --format %artist` - `mocp --format %song`";
# notify-send ignores the timeout parameter
# so we kill the process manually
sleep 1;
pkill notify-osd;

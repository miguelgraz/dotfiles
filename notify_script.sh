#!/bin/bash

# Script to send a notification about the current playing song
# Called from "spotify-now" available on https://github.com/getmicah/spotify-now and custom keyboard shortcut
# Notification built using the same format as Spotify's default

/usr/bin/notify-send --hint=int:transient:1 -i audio-x-generic "`spotify-now -i '%title'`" "`spotify-now -i '%artist - %album'`";
# notify-send ignores the timeout parameter
# so we kill the process manually
sleep 1;
pkill notify-osd;

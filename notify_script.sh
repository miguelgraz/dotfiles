#!/bin/bash

# Script to be called from MOC's option "OnSongChange"
# to pop a desktop notification with the current song's data

artist=$1;
title=$2;
/usr/bin/notify-send "${artist} - ${title}";
# notify-send ignores the timeout parameter
# so we kill the process manually
sleep 1;
pkill notify-osd;

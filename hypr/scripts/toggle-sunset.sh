#!/usr/bin/env bash

if pgrep -x "hyprsunset" > /dev/null; then
    killall hyprsunset
else
    killall -9 hyprsunset gammastep wlsunset 2>/dev/null
    sleep 0.1
    nohup hyprsunset --temperature 3500 >/dev/null 2>&1 &
    disown
fi

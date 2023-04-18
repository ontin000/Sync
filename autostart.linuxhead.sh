#!/bin/bash
xset -display :0.1 -dpms &
xset -display :0.1 s off &
DISPLAY=:0.1 openbox &
sh /home/mike/Shell/vnc2.sh &
#DISPLAY=:0.1 sh /home/mike/bin/xbmc.sh &
#sh /home/mike/Shell/proxy.sh localhost start &
#sleep 5s && kodi

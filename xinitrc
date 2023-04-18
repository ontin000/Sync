#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#xcompmgr -fcC &
#blugon &

## move these to rc.local or something smarter
#sudo ifconfig wlan0 up &
#sudo dhclient wlan0 &
#sudo dhclient wlan0 &
#
## this was active in Archhead, lets see what happens when we turn it off
#xrandr --output HDMI2 --mode 1920x1080i --rate 60 &
#xrandr --output HDMI2 --mode 1920x1080i --rate 60 --set "Broadcast RGB" "Full" --transform 1.05,0,-44,0,1.05,-30,0,0,1 &

~/Sync/vnc.sh &

exec dbus-launch openbox-session

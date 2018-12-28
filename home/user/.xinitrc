#!/bin/sh
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

xrdb -merge .Xresources

sh ~/.fehbg &

nm-applet &

numlockx &
compton --config $HOME/.config/i3/compton.conf --vsync opengl &
pulseaudio &

exec i3
xset s off

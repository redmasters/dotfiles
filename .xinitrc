#!/bin/sh

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#conf de video
#exec ~/.screenlayout/01.sh &

#bar 
exec ~/.config/polybar/launch.sh &

#wallpape
exec feh  --randomize --bg-fill ~/Imagens/wall/* &

#idioma
setxkbmap br &

#cursor do mouse
xsetroot -cursor_name left_ptr &

#urvt
xrdb -load ~/.Xdefaults &

#I3wm
exec i3

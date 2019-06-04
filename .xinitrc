#!/bin/bash
#exec nitrogen --restore &

# source for the terminal
xrdb -merge $HOME/.xres &

# font
xset fp+ $HOME/.fonts &
xset fp rehash &
xset r rate 250 60
#redshift -O1000
# set keyboard layout to us
setxkbmap us &
test -e /shared/gk/Desktop || vmhgfs-fuse -o allow_other -o auto_unmount .host:/gk /shared/gk
# Start your wm!
# /root/bin/dwm_status &
while true; do
    ssh-agent /usr/local/bin/dwm 2>/root/.dwm.log
    #ssh-agent /usr/bin/i3 2>/root/.dwm.log
done


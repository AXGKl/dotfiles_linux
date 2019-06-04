#!/bin/bash
#exec nitrogen --restore &

# source for the terminal
xrdb -merge $HOME/.xres &

# font
xset fp+ $HOME/.fonts &
xset fp rehash &
xset r rate 250 45
#redshift -O1000
# set keyboard layout to us
setxkbmap us &
# mount shared folders:
test -e /shared/gk/Desktop || vmhgfs-fuse -o allow_other -o auto_unmount .host:/gk /shared/gk

# drag and drop:
# https://wiki.archlinux.org/index.php/VMware/Installing_Arch_as_a_guest
vmware-user

# clipboard manager (dmenu https://github.com/Pitometsu/keratin)
/root/bin/keratin -d

/root/bin/dwm_status &
while true; do
    ssh-agent /usr/local/bin/dwm 2>/root/.dwm.log
    #ssh-agent /usr/bin/i3 2>/root/.dwm.log
done


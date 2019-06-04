# Fedora 30 Install (vmware fusion 11)

- In Fed30 Software Picker choose minimal, with admin tools and basic window managers -> you get lightdm.
- vmware installs fusion tools automatically :-)

## Super-C(opy):

Via vmware fusion keyboard mapping we map super-c to control-shift-c (same vor v). 
So we can still kill via Ctrl-C

# Suckless

patch -pw < patch.diff
make clean install

on error : add -R to patch command: patch -R -pw < patch.diff


# Dwm:

Tutorial: https://dwm.suckless.org/tutorial/

## Setup:
# https://jacekkowalczyk.wordpress.com/2018/11/20/how-to-install-dwm-from-suckless-org-at-fedora-29/
## installs:

	sudo dnf install dwm git dmenu st
	mkdir ~/git && cd ~/git
	git clone git://git.suckless.org/dwm
	cd dwm 

	sudo dnf install libX11-devel
	sudo dnf install libXft-devel
	sudo dnf install libXinerama-devel

	sudo dnf install xorg-x11-xinit-session
	sudo dnf install nitrogen

- then adapt config.mk as given in link.

- then for lightdm 
https://blkct.wordpress.com/2017/06/16/how-to-start-dwm-from-lightdm/


# ST

- 0.8 with patches as in folder, order like on webpage given
- Install Hack
- Modify config.h to use it





# Big Resolution: xorg.conf

	Xorg :0 -configure # basic xorg to start

Modify:

Get Modline from `gtf 3840 2160 30 -x`

Add to Monitor in xorg.conf 
killall dwm ; start x -> big monitor :-)







# Addendum

## xorg

```
[root@localhost inst]# cat /etc/X11/xorg.conf
Section "ServerLayout"
	Identifier     "X.org Configured"
	Screen      0  "Screen0" 0 0
	InputDevice    "Mouse0" "CorePointer"
	InputDevice    "Keyboard0" "CoreKeyboard"
EndSection

Section "Files"
	ModulePath   "/usr/lib64/xorg/modules"
	FontPath     "catalogue:/etc/X11/fontpath.d"
	FontPath     "built-ins"
EndSection

Section "Module"
	Load  "glx"
EndSection

Section "InputDevice"
	Identifier  "Keyboard0"
	Driver      "kbd"
EndSection

Section "InputDevice"
	Identifier  "Mouse0"
	Driver      "mouse"
	Option	    "Protocol" "auto"
	Option	    "Device" "/dev/input/mice"
	Option	    "ZAxisMapping" "4 5 6 7"
EndSection

Section "Monitor"
	Identifier   "Virtual1"
	VendorName   "Monitor Vendor"
	ModelName    "Monitor Model"
	Modeline "3840x2160_30.00"  339.57  3840 4080 4496 5152  2160 2161 2164 2197  -HSync +Vsync
	Option "PreferredMode"   "3840x2160_30.00"
EndSection

Section "Device"
        ### Available Driver options are:-
        ### Values: <i>: integer, <f>: float, <bool>: "True"/"False",
        ### <string>: "String", <freq>: "<f> Hz/kHz/MHz",
        ### <percent>: "<f>%"
        ### [arg]: arg optional
        #Option     "HWcursor"           	# [<bool>]
        #Option     "Xinerama"           	# [<bool>]
        #Option     "StaticXinerama"     	# <str>
        #Option     "GuiLayout"          	# <str>
        #Option     "AddDefaultMode"     	# [<bool>]
        #Option     "RenderAccel"        	# [<bool>]
        #Option     "DRI"                	# [<bool>]
        #Option     "DirectPresents"     	# [<bool>]
        #Option     "HWPresents"         	# [<bool>]
        #Option     "RenderCheck"        	# [<bool>]
	Identifier  "Virtual1"
	Driver      "vmware"
	BusID       "PCI:0:15:0"
	Option      "monitor-Virtual1"     "Virtual1"
EndSection
Section "Screen"
	Identifier "Screen0"
	Device     "Virtual1"
	Monitor    "Virtual1"
        DefaultDepth   24
        
	SubSection "Display"
		Depth    24 
                Modes  "3840x2160" "1024x768"
	EndSubSection
EndSection

[root@localhost inst]# 
```



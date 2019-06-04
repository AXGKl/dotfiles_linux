# Fedora 30 Install (vmware fusion 11)

- In Fed30 Software Picker choose minimal, with admin tools and basic window managers -> you get lightdm.
- vmware installs fusion tools automatically :-)

# Shortcuts

unusual ones:

- super-shift-x: https://dwm.suckless.org/patches/killunsel/dwm-killunsel-ceac8c91ff.diff
- super-g: grid layout
- ctrl-k: clear history (alacritty config)
- super-p: dmenu launcher (disabled mapping in vmware keymapper)

## Via Vmware Keymapper:

Via vmware fusion keyboard mapping we map super-c to control-shift-c (same vor v). 
So we can still kill via Ctrl-C


- super-n = super-shift-return: new terminal (via vmware keymap)
- super-w = super-shift-c: kill window (via vmware keymap)
- super-c = super-shift-c (same for v): copy and paste

# Base Install

[./inst](./inst) folder.

## Suckless

patch -pw < patch.diff
make clean install

on error : add -R to patch command: patch -R -pw < patch.diff

Better: git commit before, then try, then commit.


### Dwm:

Tutorial: https://dwm.suckless.org/tutorial/

#### Setup:
	https://jacekkowalczyk.wordpress.com/2018/11/20/how-to-install-dwm-from-suckless-org-at-fedora-29/

#### installs:

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


### ST

- 0.8 with patches as in folder, order like on webpage given
- Install Hack
- Modify config.h to use it

Did not stay with it, too slow on wide screen - went to alacritty

#### Alacritty

superfast terminal, nice config yaml.

dnf copr enable mizuo/alacritty



## Big Resolution: xorg.conf

	Xorg :0 -configure # basic xorg to start

Modify:

Get Modline from `gtf 3840 2160 30 -x`

Add to Monitor in xorg.conf 
killall dwm ; start x -> big monitor :-)

## Vmware Tools

helpfull: https://wiki.archlinux.org/index.php/VMware/Installing_Arch_as_a_guest
Basically I did nothing - they were installed correctly - except:

- Installed vmxnet3 ehternet driver via enabling in .vmx file.

- for Copy and Paste: vmware-user invokation in .xinitrc



### Mouse /Keyboard

xev is your friend, compare in mac and linux. No problems so far.





# Addendum

[xorg](./inst/xorg.conf)  (symlinked to /etc/X11/xorg.conf)

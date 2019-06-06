# .bashrc

# User specific aliases and functions
alias godwm='cd /root/inst/suckless/dwm-6.2'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias pin='ping 8.8.8.8'
alias gs='git status'
alias wd='display_size w'
alias wm='display_size m'
alias open='xdg-open'

# alacritty TERM is not supported remotely in vim:
# term env also sent over to remote host, setting TERM away from alacritty (there not in termenv):
test -z "$PROMPT_COMMAND" && { source /root/bin/terminal_env_to_source.sh; export TERM=alacritty; }
#source /root/inst/z/z.sh

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

ff () {
     find . -type f -type d -name proc -prune -o -name "*" | grep --color=auto -i "$1"
}



export PATH="/root/bin:$PATH"
#set_title="\[\e]0;[\$SHLVL] `hostname` \$PWD\e]0\a\]"
#PS1="$PS1$set_title"
echo "h for help"

h () {
	test -z "$1" && echo -e "
	-dwm
	"
	test "$1" == "dwm" && zathura "/root/inst/help/dwm.pdf"


}



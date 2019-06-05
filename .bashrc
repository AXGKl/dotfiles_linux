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

source /root/inst/z/z.sh
#PROMPT_COMMAND='(_z --add "$(command pwd -P 2>/dev/null)" 2>/dev/null &);printf "\033]0;%s@%s - %s\007" "`whoami`" "`hostname`" "`pwd`"'
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

ff () {
     find . -type f -type d -name proc -prune -o -name "*" | grep --color=auto -i "$1"
}

export PATH="/root/bin:$PATH"

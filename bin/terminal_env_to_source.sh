#!/usr/bin/sh
# this is sourced locally in .bashrc but also for the ssh alias:
export ESC=$'\e'
export PROMPT_COMMAND='printf "\033]0;%s@%s [%s] %b\007" "`whoami`" "`hostname`" "$SHLVL" "$PWD"';
export HGUSER='gunther.klessinger@axiros.com';
export GIT_AUTHOR_NAME='Gunther Klessinger';
export GIT_AUTHOR_EMAIL='gk@axiros.com';
export GIT_COMMITTER_NAME='Gunther Klessinger';
export TERM='xterm-256color';


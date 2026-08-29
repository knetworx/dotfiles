#!/bin/bash
#printscriptlocation

function safeecho() {
	# Only echo in interactive shell
	if [[ $- =~ "i" ]]; then
		echo $@
	fi
}

if [[ $BASH_ARGV ]]; then
	safeecho "Sourcing: $BASH_ARGV"
else
	safeecho "Sourcing: ${BASH_SOURCE[0]}"
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

unset color_prompt force_color_prompt

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -d $DIR/bash_completion ] && ! shopt -oq posix; then
	safeecho "Processing completion files in $DIR/bash_completion"
	for f in $DIR/bash_completion/*
	do
		safeecho "==> ${f##*/}"
		. $f
	done
	safeecho "Done"
fi

colors=1
if [ -f $DIR/colors.bash ]; then
	safeecho "Initializing colors from $DIR/colors.bash"
	. $DIR/colors.bash
else
	colors=0
	safeecho "Colors not found in $DIR"
fi

hostname="\H"
# Optional: Show the computer's human-readable name
# Note: Mac hostname can be set via "sudo scutil --set HostName new_hostname"
#if [ $ENV_TYPE = "mac" ]; then
#	hostname=`(scutil --get ComputerName)`
#fi

repo_prompt() {
	if [ "$?" -eq "0" ]; then
		#symbol=🐵
		#symbol=😀
		symbol="\[$txtgrn\]:)\[$txtrst\]"
	else
		#symbol=🙈
		#symbol=🙁
		symbol="\[$txtred\]:(\[$txtrst\]"
	fi
	# See if it's an SVN repo, if so, get the branch name
	relurl="$(svn info --show-item relative-url 2>/dev/null)"
	# If not SVN, see if it's a Git repo, and get the branch name
	if [[ $relurl == "" ]]; then
		relurl="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
	fi
	# If we've found some repo name (Git or SVN), format it
	if [[ $relurl != "" ]]; then
		relurl=" \[$txtylw\]($relurl)"
	fi
	#PS1="╭─\[$txtred\](\T) \[$txtcyn\]$hostname$relurl\[$txtrst\]\n╰─➤ $symbol \[$txtwht\][\w] \[$txtgrn\]=>\[$txtrst\] "
	PS1="╭─\[$txtred\](\T) \[$txtcyn\]$hostname\[$txtblu\] \w $relurl\[$txtrst\]\n╰─➤ $symbol \[$txtgrn\]=>\[$txtrst\] "
	# Add the tab title
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)} \W\a\]$PS1"
}

#export PS1='[\[\033[41;1m\] LIVE \[\033[0m\]] \u@\h:\w$ '
if [ colors ]; then
	# Set a nice pretty prompt
	PROMPT_COMMAND=repo_prompt
else
	# Set a boring old plain text prompt
	PS1="(\T) \u@$hostname \W \$ "
fi

# Add Set the terminal title
PS1="\[\e]0;${debian_chroot:+($debian_chroot)} \W\a\]$PS1"

# See: http://en.wikipedia.org/wiki/ANSI_escape_code

#Colors
#		 fg 30+ / bg 40+
# black			0
# red			1
# green			2
# yellow		3
# blue			4
# magenta		5
# cyan			6
# white			7
#export GREP_COLOR='1;34'
export GREP_COLOR='0;32'

# If you have any local settings that shouldn't be included in the repo, put them in .bashrc_local in your home directory
if [ -f ~/.bashrc_local ]; then
	. ~/.bashrc_local
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

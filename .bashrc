#
# ~/.bashrc
#

[[ "$-" != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ "${EUID}" == 0 ]] ; then
		PS1='\[\033[1;31m\]\u@\h\[\033[0m\]:\[\033[1;36m\]\W\[\033[0m\]\$ '
	else
		PS1='\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\W\[\033[0m\]\$ '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
  # noncolorful prompt
	if [[ "${EUID}" == 0 ]] ; then
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# check window size after each command or when terminal regains control of foreground
shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#don't put duplicate lines or lines starting with space in the history
#HISTCONTROL=ignoreboth

#change cursor to unblinking full block in tty
if [ "$XDG_SESSION_TYPE" = tty ]; then
 echo -ne "\e[?16;7;112c"
fi

# Aliases in separate file
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Functions in separate file
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

PATH="$PATH:$HOME/.opam/default/bin"

USE_CCACHE=1
NDK_CCACHE="$HOME/.cache/ccache"

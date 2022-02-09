# Sourced from default Manjaro install
# Prints some information about the colors in this terminal
colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

connectbandit() {
  sshpass -f $1 ssh bandit${1}@bandit.labs.overthewire.org -p 2220
}

pamac() {
    if [ "$1" = "upgrade" -o "$1" = "update" ]; then
        shift
        command pamac upgrade -a "$@"
    else
        command pamac "$@"
    fi
}

treesize() {
    local DIR
    DIR=${cwd}
    if [ -n "$1" ]; then
        if [ ! -e "$1" ]; then
            echo "cannot open '$1' (no such file or directory)"
        fi
        DIR=$1
    fi
    du $DIR -ah --threshold=32K --max-depth=1 2>/dev/null | sort -hr
}

# vim: set ft=bash:

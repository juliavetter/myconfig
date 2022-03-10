alias ll='ls -AhlF'
alias la='ls -A'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# confirm before overwriting something
alias cp='cp -i'
alias more=less

alias occs='ssh kvetter@occs.cs.oberlin.edu'

alias starthamachi='systemctl start logmein-hamachi.service'

# cataclysm development aliases
alias catamake='make -j5 CCACHE=1 TILES=1 RELEASE=1'
alias catamake1='make CCACHE=1 TILES=1 RELEASE=1'

# angband curses mode
alias angband='angband -mgcu -- -n2'
# top right for equipment (13), next for inventory (26), rest for whatever
alias frogcomposband='frogcomposband -mgcu -- -right 57x13,26,*'

# vim: set ft=bash

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
alias catamake='make -j10 CCACHE=1 TILES=1 RELEASE=1 RUNTESTS=0'

# angband curses mode
# top right for minimap, then for nearby monsters, then for monster recall
alias angband='angband -mgcu -- -right 57x25,10,*'
alias frogcomposband='frogcomposband -mgcu -- -right 57x13,15,*'

# vim: set ft=bash

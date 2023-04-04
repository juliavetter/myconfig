alias ll='ls -AhlF'
alias la='ls -A'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias stat='stat -x'

# confirm before overwriting something
alias cp='cp -i'
alias more=less

alias occs='ssh kvetter@occs.cs.oberlin.edu'

alias starthamachi='systemctl start logmein-hamachi.service'

# cataclysm development aliases
alias catamake='make app -j10 TILES=1 RELEASE=1 RUNTESTS=0'

# angband curses mode
# top right for minimap, then for nearby monsters, then for monster recall
alias angband='angband -mgcu -- -right 50x20,10,*; tput init'
alias frogcomposband='frogcomposband -mgcu -- -right 57x13,15,*'

alias crawl='/Applications/Dungeon\ Crawl\ Stone\ Soup\ -\ Console.app/Contents/Resources/crawl'

alias devserver='mosh jvetter@jvetter.sb.facebook.com'

# vim: set ft=bash

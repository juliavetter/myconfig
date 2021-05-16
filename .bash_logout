#
# ~/.bash_logout
#

# reset cursor to normal if in tty
if [ $XDG_SESSION_TYPE = tty ]; then
  tput cnorm
fi

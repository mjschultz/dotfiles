SYSTEM=$(uname -s | tr '[A-Z]' '[a-z]')
[ -f $SYSTEM ] && source $SYSTEM

SYSTEM=$(uname -s | tr '[A-Z]' '[a-z]')
DIR="$DOTPATH/system"
[ -f "$DIR/$SYSTEM.system" ] && source "$DIR/$SYSTEM.system"

# This finds the local hostname and domainname
# It then attempts to load some domain-specific variables followed by
# host-specific

# I've never seen this command work, but give it a shot
DOMAINNAME=$(domainname)
HOSTNAME=$(hostname)

# Maybe the hostname has the domain name in it...
if [ -n "$DOMAINNAME" -o "$DOMAINNAME" == "(none)" ] ; then
    DOMAINNAME=${HOSTNAME#*.}
fi

# Hostname is easy to pickup, but strip the domainname
HOSTNAME=${HOSTNAME/.*}

DIR="$DOTPATH/hosts"
[ -f "$DIR/$DOMAINNAME.domain" ] && source "$DIR/$DOMAINNAME.domain"
[ -f "$DIR/$HOSTNAME.host" ] && source "$DIR/$HOSTNAME.host"

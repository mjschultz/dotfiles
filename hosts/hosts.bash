# This finds the local hostname and domainname
# It then attempts to load some domain-specific variables followed by
# host-specific

# I've never seen this command work, but give it a shot
DOMAINNAME=$(domainname)

# Maybe the hostname has the domain name in it...
if [ -n "$DOMAINNAME" -o "$DOMAINNAME" == "(none)" ] ; then
    DOMAINNAME=$(hostname#*.)
fi

# Hostname is easy to pickup, but strip the domainname
HOSTNAME=$(hostname)
HOSTNAME=${HOSTNAME/.*}

[ -f "$DOMAINNAME.domain" ] && source "$DOMAINNAME.domain"
[ -f "$HOSTNAME.host" ] && source "$HOSTNAME.host"

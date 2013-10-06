#!/bin/bash -ex

TARSNAP=/usr/local/bin/tarsnap
NOTIFIER=/usr/local/bin/terminal-notifier

DATE=$(date +%FT%T%z)
SNAPSHOT=snapshot-$DATE

start_time=$(date +%s)
$TARSNAP -c -f $SNAPSHOT $*
status=$?
end_time=$(date +%s)
delta=$(($end_time - $start_time))

if [ -x $NOTIFIER ] ; then
    title="tarsnap"
    subtitle="$SNAPSHOT"
    if [ $status -eq 0 ] ; then
        message="succeeded in $delta seconds"
    else
        message="backup failed (status: $status)"
    fi
    $NOTIFIER -title "$title" \
              -subtitle "$subtitle" \
              -message "$message"
fi

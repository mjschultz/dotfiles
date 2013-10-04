#!/bin/bash -ex

SOURCE=/Users/mjschultz
TARSNAP=/usr/local/bin/tarsnap
DATE=$(date +%FT%T%z)

$TARSNAP -c -f snapshot-$DATE $SOURCE

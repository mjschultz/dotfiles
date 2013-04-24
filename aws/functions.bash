#!/bin/bash
# Load a set of AWS keys
DEFAULT="mjschultz"
KEYPATH="$DOTPATH/aws/keys.private"

if [ "${BASH_VERSION/.*/}" -ge "4" -a -f "$KEYPATH" ] ; then
    declare -A AWS_ACCESS_KEYS AWS_SECRET_KEYS
    source "$KEYPATH"
fi

aws_keys () {
    key=${1-$DEFAULT}

    export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEYS[$key]}
    export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_KEYS[$key]}
}

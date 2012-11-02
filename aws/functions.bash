#!/bin/bash
# Load a set of AWS keys
DEFAULT="mjschultz"

if [ "${BASH_VERSION/.*/}" -ge "4" ] ; then
    declare -A AWS_ACCESS_KEYS AWS_SECRET_KEYS
    source $DOTPATH/aws/keys.private
fi

aws_keys () {
    key=${1-$DEFAULT}

    export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEYS[$key]}
    export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_KEYS[$key]}
}

function temp {
    # create a temporary directory
    tempdir=/tmp/$(uuidgen)
    mkdir $tempdir/temp
    # change to tempdir and create a subshell
    ( cd $tempdir/temp && /bin/bash )
    # remove tempdir on shell exit
    rm -rf $tempdir
}

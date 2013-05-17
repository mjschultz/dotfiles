if [ -d $HOME/.virtualenvs ] ; then
    export WORKON_HOME=$HOME/.virtualenvs
    source $(which virtualenvwrapper.sh)
fi

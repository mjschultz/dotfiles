# Set some sensible PATHs
prepend_path "/usr/local/bin"
prepend_path "$DOTPATH/bin"
prepend_path "$HOME/bin"
append_path "/usr/local/sbin"
append_path "/usr/sbin"
append_path "/sbin"
append_path "/usr/local/go/bin"

export MANPATH=$HOME/man:$MANPATH
export CDPATH=.:$HOME/Projects
export LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH

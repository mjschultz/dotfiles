if [ -z "$SSH_CONNECTION" ] ; then
    PS1='[\u $(__git_ps1 "%s:")\W]\$ '
else
    PS1='[\u@\h $(__git_ps1 "%s:")\W]\$ '
fi

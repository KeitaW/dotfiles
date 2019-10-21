export PATH="$HOME/dotfiles/bin/bash:$PATH"
# Load local config
LOCALCONFIG="$HOME/.zshenvlocal"
if [ -f $LOCALCONFIG ] ; then
    source $LOCALCONFIG
fi



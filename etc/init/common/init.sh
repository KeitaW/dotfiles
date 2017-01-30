CONFIGDIR=~/.config
if [ ! -d $CONFIGDIR ]
then
	echo "No $CONFIGDIR found. Create it."
	mkdir $CONFIGDIR
else
	echo "$CONFIGDIR exists. Skip."
fi

echo "Dein will be installed in ~/.config"
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
NVIMDIR=~/.config/nvim
if [ ! -d $NVIMDIR ]
then
	echo "No $NVIMDIR found. Create it."
	mkdir -p $NVIMDIR
else
	echo "$NVIMDIR exists. Skip."
fi
sh ./installer.sh  ~/.config/nvim/dein 
rm installer.sh

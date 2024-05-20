#!/usr/bin/bash

# If argument is passed --delete, delete the folder before creating the links
for d in dot_config/*; do
	config_path=~/.config/$(basename $d)
	if [ "$1" == "--delete" ]; then
		echo "Deleting $config_path"
		sudo rm -r $config_path
	fi
	echo "Adding $config_path"
	sudo ln -s $(pwd)/$d ~/.config
done

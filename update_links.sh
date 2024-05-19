#!/usr/bin/bash

for d in dot_config/*; do
	config_path=~/.config/$(basename $d)
	echo "Deleting $config_path"
	sudo rm -r $config_path
	echo "Adding $config_path"
	sudo ln -s $(pwd)/$d $config_path
done

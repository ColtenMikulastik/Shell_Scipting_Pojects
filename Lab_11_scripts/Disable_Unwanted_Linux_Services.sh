#!/bin/bash

#Name: Colten Mikulastik
#Date: 11/3/2022
#Class: Advanced Linux
#Lab: Lab 11: Scripting for Secuirty

# This script checks services and will automatically stop apache2 service

# First check for root user

if [[ $EUID == 0 ]]
then
	echo "you are the root user!"
	echo "starting script"

	# look for all systemd services
	systemctl list-unit-files --type=service
	# look at loaded units in graphical run level
	systemctl list-dependencies graphical.target

	# turn off apache2
	systemctl stop apache2
	# disable apache2
	systemctl disable apache2
else
	echo "try running script again as root"
fi



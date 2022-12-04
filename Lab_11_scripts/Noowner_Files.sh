#!/bin/bash

#Name: Colten Mikulastik
#Date: 11/3/2022
#Class: Advanced Linux
#Lab: Lab 11: Scripting for Secuirty

# This script looks for no-owner files in the root directory

# First check for root user

if [[ $EUID == 0 ]]
then
	echo "you are the root user!"
	echo "starting script"

	# look for no-owner files in the root directoryt
	find / -xdev \( -nouser -o -nogroup \) -print
else
	echo "try running script again as root"
fi



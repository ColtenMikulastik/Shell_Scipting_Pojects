#!/bin/bash

#Name: Colten Mikulastik
#Date: 11/3/2022
#Class: Advanced Linux
#Lab: Lab 11: Scripting for Secuirty

# This script checks for World-Writable Files on Linux Server

# First check for root user

if [[ $EUID == 0 ]]
then
	echo "you are the root user!"
	echo "starting script"

	# look for world writable files, root directory
	find / -xdev -type d \( -perm -0002 -a ! -perm -1000 \) -print
else
	echo "try running script again as root"
fi



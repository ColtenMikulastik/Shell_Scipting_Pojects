#!/bin/bash

#Name: Colten Mikulastik
#Date: 11/3/2022
#Class: Advanced Linux
#Lab: Lab 11: Scripting for Secuirty

# This script disables the 'unused' ssh services from this machine

# First check for root user

if [[ $EUID == 0 ]]
then
	echo "you are the root user!"
	echo "starting script"

	# look for sshd service
	systemctl status sshd
	# turn sshd service off, and disable that service on startup
	systemctl stop sshd
	systemctl disable sshd
else
	echo "try running script again as root"
fi



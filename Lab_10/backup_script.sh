#!/bin/bash

# Name: Colten Mikulastik
# Date: 10/26/2022
# Class: ITSC 2325 0400 Advanced Linux
# Lab: Lab 10

# This script will back up the home directory of specified user, and back it up to the /tmp directory

 

# First, the user needs to be root or super user
if [[ $EUID != 0 ]]
then
	# this script must be run as a super user or root
	echo "you are not root or a super user, you must be super user to use this script"
else
	# notify user of script's start
	echo "running script under root or super user"
	
	# ask user which linux user's home directory they want to back-up
	echo "what user's home direcorty would you like to back up?:"
	# read that information
	read user
	echo "You have chosen $user!!"
	
	# notify user backup has started 
	echo "Beginning backup of $user's home directory"

	# actually start backup program
	sudo tar -cvpzf /tmp/backup.tar.gz /home/$user

	# notify user of backup's completion
	echo "BACKUP complete!"
	echo "look for the file in the /tmp dir"
fi

# Exit status

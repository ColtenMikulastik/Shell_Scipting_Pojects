#!/bin/bash

# Name: Colten Mikulastik
# Date: 10/26/2022
# Class: ITSC 2325 0400 Advanced Linux
# Lab: Lab 10

# This script checks the available disk space on drives and puts output in user's home dir

# First, if the user needs to be root, check to make sure the root user is executing this command. If not, then inform the user they must use root privileges
if [[ $EUID != 0 ]]
then
	echo "you are not root or super user"
else
	echo "prepairing script"
fi

# notify user about checking disk space
echo "checking disk space left..."

# run the df command, and make it human readable
df_out=$(df -h)

#put the output into the directory of the running user
if [[ $EUID != 0 ]]
then
	echo "you are not root, look in your home directory"
	# this user is not root and home directory is different
	touch /home/$USER/Disk_Space_Note.txt
	echo "$df_out" >> /home/$USER/Disk_Space_Note.txt
else
	echo "you are root output file is in /root"
	touch /root/Disk_Space_Note.txt
	echo "$df_out" >> /root/Disk_Space_Note.txt
fi

echo "The check has completed"
 

# Exit status

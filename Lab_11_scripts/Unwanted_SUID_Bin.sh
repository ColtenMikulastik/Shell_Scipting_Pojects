#!/bin/bash

#Name: Colten Mikulastik
#Date: 11/3/2022
#Class: Advanced Linux
#Lab: Lab 11: Scripting for Secuirty

# This script finds unwanted SUID nad SGIUD binaries

# First check for root user

if [[ $EUID == 0 ]]
then
	echo "you are the root user!"
	echo "starting script"
	
	find / \( -perm -4000 -o -perm -2000 \) -print
else
	echo "try running script again as root"
fi



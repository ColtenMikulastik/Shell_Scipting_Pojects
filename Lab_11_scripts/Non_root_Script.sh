#!/bin/bash

#Name: Colten Mikulastik
#Date: 11/3/2022
#Class: Advanced Linux
#Lab: Lab 11: Scripting for Secuirty

# This script

# First check for root user

if [[ $EUID == 0 ]]
then
	echo "you are the root user!"
	echo "starting script"

	# run awk cmd that was in the article
	awk -F: '($3 == "0") {print}' /etc/passwd
else
	echo "try running script again as root"
fi



#!/bin/bash

# Name: Colten Vance Mikulastik
# Date: 11/29/2022
# Class: Advanced Linux
# Lab: Lab 15 Expect 

# This script changes the passwords of 5 users given from teh input file to their usernames
 
# First, if the user needs to be root, check to make sure the root user is executing this command. If not, then inform the user they must use root privileges
if [ $EUID == 0 ]
then
    # loop through the users in the input.txt file
    for line in $(cat input.txt)
    do
        # call the expect script, and pass the username as the argument
	    ./change_user_password.exp $line
    done
else
    # tell the user that they need to change their permissions
    echo "you are not the root user or sudoer"
    echo "please run program as sudoer"
fi

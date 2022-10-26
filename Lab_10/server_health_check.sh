#!/bin/bash

# Name: Colten Mikulastik
# Date: 10/25/2022
# Class: ITSC 2325 0400 Advanced Linux
# Lab: Lab 10

# This script checks the health of your computer/server, letting you know infomration about how it is running.

# functions
# newline function so that I don't have to type it out echo everytime
function newline
{
    for (( i=0; i<$1; i++))
    do
        echo ""
    done
}


# First, if the user needs to be root, check to make sure the root user is executing this command. If not, then inform the user they must use root privileges
if [[ $EUID != 0 ]]
then
    echo "you are not root or super user, please fix and try again"
else
    echo "prepairing script"
fi

echo "############ BEGINING SERVER/COMPUTER HEALTH CHECK ############ "
newline 2


# tell the user who they are
usern=$(whoami)
echo "you are user $usern"
newline 2

# check the uptime
u_time=$(uptime)
echo "server has been running: $u_time"
newline 2



# check the OS of the server

echo "############ SERVER/COMPUTER HEALTH CHECK COMPLETED ############ "
# Exit status

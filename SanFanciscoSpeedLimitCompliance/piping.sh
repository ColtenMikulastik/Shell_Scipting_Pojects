#!/bin/bash

# Name: Colten Vance Mikulastik
# Date: 11/9/2022
# Class: Advanced Linux
# Lab: Lab 12

# This script runs the piping command described in the article, but uses it on my /etc folder

# function to stop the script from running
take_a_break()
{
	echo "press enter to continue script:"
	read
}


# shows the five largest files in my etc directory
ls -l /etc | grep "conf" | awk '{print $5 " " $3 " " $9}' | sort -n | tail -5
 
#stop the script from runnning
take_a_break

# the command piping
# this pipe looks in my etc directory and tells me how many unquie filenames there are disregarding file extentions
ls /etc | rev | cut -d'.' -f1 | rev| sort | uniq -c

take_a_break

# create the named pipe called geek-pipe
mkfifo geek_pipe

# halt terminal with the named pipe
ls /etc | rev | cut -d'.' -f1 | rev| sort | uniq -c > geek_pipe

# read from teh named pipe to return access to terminal
cat < geek_pipe


# Exit status

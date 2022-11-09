#!/bin/bash

# Name: Colten Vance Mikulastik
# Date: 11/09/2022
# Class: Advanced Linux
# Lab: Lab 12

# This script parses data from an input file
# and then outputs a formated file "output.txt"

# notify user about which file it will be parsing
echo "Running sanfran.sh..."
echo "About to parse from file: $1"

# this can be done
cat $1 | sed 's/,/\t\t/g' > ouput.txt
 

# First, if the user needs to be root, check to make sure the root user is executing this command. If not, then inform the user they must use root privileges

 

# Then, appropriate comments for whatever this script does.

 

# Exit status

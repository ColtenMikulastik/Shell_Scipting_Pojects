#!/bin/bash

# Name: Colten Mikulastik
# Date: 10/28/2022
# Class: 
# Lab: Lab 10

# This script goes through text files and creates a sha sum and will check the files for changes :^)
# that is all this script does :^) you are welcome

### This program works by running first with the '-s' option, and specifing a path to a directory with the files you want to watch
### then you can then put the command in your cron file with the file to the watched directory,
### you will have updates in your "change_log.txt" file in teh watched directory.

# you don't need to be root

# check for the options
if [[ $1 == "-s" ]]
then
    # if the user adds the -s option then start the checksum process
    # the next arg should be a file path so save that to a var
    file_of_choice=$2
    for file in $file_of_choice/*
    do
        # save that sum in a .sum file
        sha256sum $file > $file.sum
    done 
else
    # check the file given, and look for all the check sums in that file
    file_of_choice=$1
    echo -n "file change check starting: " >> $file_of_choice/change_log.lst
    date >> $file_of_choice/change_log.lst
    # once again loop through all the files
    for file in $file_of_choice/*
    do
        # if file is a checksum file use teh cmd to use it to check for changes
        if [[ $file == *.sum ]]
        then
            sha256sum -c $file >> $file_of_choice/change_log.lst
        fi
    done
fi

# Exit status

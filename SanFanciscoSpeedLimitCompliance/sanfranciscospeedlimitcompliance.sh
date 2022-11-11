#!/bin/bash

# Name: Colten Vance Mikulastik
# Date: 11/09/2022
# Class: Advanced Linux
# Lab: Lab 12

# This script parses data from an input file
# and then outputs a formated file "output.txt"

# notify user about which file it will be parsing
echo "Running sf.sh..."
echo "About to parse from file: $1"

# this can be done
# cat $1 | sed 's/,/\t\t/g' > ouput.txt 

# create a variable with the output of the input file
file=$(cat $1)

# create the ouput folder
touch output.txt 

# clear out the output folder in case it already existed
echo "" > output.txt

# loop through the file's output
for line in $file
do
    # if the file is the first line so the spacing is correct
	if [[ $line == $(head -1 $1) ]]
	then
        # the first line is only one tab
		echo $line | sed 's/,/\t/g' >> output.txt
        # deliniate the headers with the data
		echo "====================================================================================================================" >> output.txt
	else
        # if the line is data, then three tab seperation
		echo $line | sed 's/,/\t\t\t/g' >> output.txt 
	fi
done


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
# cat $1 | sed 's/,/\t\t/g' > ouput.txt 


file=$(cat $1)

touch output.txt 

echo "" > output.txt

for line in $file
do
	if [[ $line == $(head -1 $1) ]]
	then
		echo "TOP OF FILE!!!!!!!"
		echo $line | sed 's/,/\t/g'
		echo $line | sed 's/,/\t/g' >> output.txt
		echo "====================================================================================================================" >> output.txt
	else
		echo $line | sed 's/,/\t\t/g'
		echo $line | sed 's/,/\t\t\t/g' >> output.txt 
	fi
done




# Then, appropriate comments for whatever this script does.

 

# Exit status

#!/bin/bash
# Colten (Luca) Vance Mikulastik: 11/18/2022

# <path>/quiz_grabber.sh ./<outputfile>

# grab the current directory
currentdir=$(pwd)

# check if they have set an output file
if [ -z "$1" ]
then
    echo "don't forget to set an output file!"
else
    echo "ouput file set to: $1"
    
    # find the files with Quiz in file name, and then print contents to teh ouput file
    cat $(find $currentdir/ -name "*Quiz*") > $currentdir/$1

    echo "done!"
fi


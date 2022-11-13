#!/bin/bash

#ex: bomb.sh <example text> <howmany>
# will create file names numbered 1 to $2

# loop until specified number
for (( i=1; i<=$2; i++ ))
do
    # seperate the front and the back of the titel
    pretitle=$(echo $1 | awk -F 'x' '{print $1}')
    postitle=$(echo $1 | awk -F 'x' '{print $2}')
    # create the real name of the thing
    currentdir=$(pwd)

    name=$(echo "$currentdir/$pretitle$i$postitle")
    # print it out

    echo $name
    # create the files
    mkdir $name
done

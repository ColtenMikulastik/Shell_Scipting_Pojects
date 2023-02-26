#!/bin/bash


# Colten (Luca) Vance Mikulastik


echo "HEY $USER WAZAH!"


echo "please give a word: "
read info

# this will loop through the characters in the string givin
for (( i = 0; i<${#info}; i++ ))
do
	echo "${info:$i:1}"

done


grep $info words.txt

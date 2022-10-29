#!/bin/bash

user="luca"

file_of_choice="/home/$user/"

for file in $file_of_choice/*
do
    echo $file
done


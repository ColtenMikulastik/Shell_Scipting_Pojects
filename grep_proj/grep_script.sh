#!/bin/bash

# Colten Vance Mikulastik
# Lab 4 using grep
# 9/17/2022

# this script was created to test grep and regex

# this function will grep whatever arguments you give it and sort them=
spec_grep () {
    grep $1 $2 ./grep_wordlist.txt | sort
}


# words ending in ing
echo "looking for words ending in \"ing\":..."
spec_grep .*ing

# number of words ening ing
echo "counting words ending in \"ing\":..."
spec_grep -c .*ing

# words starting in be
echo "looking for words starting with \"be\":..."
spec_grep ^be.*

# exact word test (I don't know why this isn't working)
echo "looking for exact word \"test\":..."
spec_grep -w test 

# word starts with m ends with t
echo "looking for word that starts with \"m\" and ends with \"t\":..."
spec_grep m.*t

# MAC addresses
echo "looking for MAC addresses:..."
spec_grep ..:..:..:..:..:..

# telephone addresses
echo "looking for telephone numbers:..."
spec_grep \(...\)-...-....

# email addresses use E to use the parenthesis
echo "looking for email addresses:..."
spec_grep -E ".*\@.*\.(com|net)"

# social security numbers
echo "looking for social security numbers:..."
spec_grep ...-..-....

# IP address
echo "looking for IP addresses:..."
spec_grep ".*\..*\..*\..*"



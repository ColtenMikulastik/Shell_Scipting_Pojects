#!/bin/bash

# Colten Vance Mikulastik
# Lab 4 using grep
# 9/17/2022

# this script was created to test grep and regex

# this function will grep whatever arguments you give it and sort them=
spec_grep () {
    grep $1 $2 ./grep_wordlist.txt | sort
}


if (( $EUID == 0 ))
then
	# words ending in ing
	echo "you are running this script as super user or root"
	echo "<starting>: looking for words ending in \"ing\":..."
	spec_grep .*ing
	echo "<finishing>: looking for words ending in \"ing\":..."
	echo ""
	
	# number of words ening ing
	echo "<starting>: counting words ending in \"ing\":..."
	spec_grep -c .*ing
	echo "<finishing>: counting words ending in \"ing\":..."
	echo ""
	
	# words starting in be
	echo "<starting>: looking for words starting with \"be\":..."
	spec_grep ^be.*
	echo "<finishing>: looking for words starting with \"be\":..."
	echo ""
	
	# exact word test (I don't know why this isn't working)
	echo "<starting>: looking for exact word \"test\":..."
	spec_grep -w test 
	echo "<finishing>: looking for exact word \"test\":..."
	echo ""
	
	# word starts with m ends with t
	echo "<starting>: looking for word that starts with \"m\" and ends with \"t\":..."
	spec_grep m.*t
	echo "<finishing>: looking for word that starts with \"m\" and ends with \"t\":..."
	echo ""

	# MAC addresses
	echo "<starting>: looking for MAC addresses:..."
	spec_grep ..:..:..:..:..:..
	echo "<finishing>: looking for MAC addresses:..."
	echo ""
	
	# telephone addresses
	echo "<starting>: looking for telephone numbers:..."
	spec_grep \(...\)-...-....
	echo "<finishing>: looking for telephone numbers:..."
	echo ""
	
	# email addresses use E to use the parenthesis
	echo "<starting>: looking for email addresses:..."
	spec_grep -E ".*\@.*\.(com|net)"
	echo "<finishing>: looking for email addresses:..."
	echo ""
	
	# social security numbers
	echo "<starting>: looking for social security numbers:..."
	spec_grep ...-..-....
	echo "<finishing>: looking for social security numbers:..."
	echo ""
	
	# IP address
	echo "<starting>: looking for IP addresses:..."
	spec_grep ".*\..*\..*\..*"
	echo "<finishing>: looking for IP addresses:..."
else
	echo "you are not a root or super user, please change you privleges and try again"
fi

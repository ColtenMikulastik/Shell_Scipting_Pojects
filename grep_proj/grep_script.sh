#!/bin/bash

# this script was created to test grep and regex

# this function will grep whatever arguments you give it and sort them=
spec_grep () {
    grep $1 $2 ./grep_wordlist.txt | sort
}


# words ending in ing
spec_grep .*ing

# number of words ening ing
spec_grep -c .*ing

# words starting in be
spec_grep ^be.*

# exact word test (I don't know why this isn't working)
spec_grep -w test 

# word starts with m ends with t
spec_grep m.*t

# MAC addresses
spec_grep ..:..:..:..:..:..

# telephone addresses
spec_grep \(...\)-...-....

# email addresses use E to use the parenthesis
spec_grep -E ".*\@.*\.(com|net)"

# social security numbers
spec_grep ...-..-....

# IP address
spec_grep ".*\..*\..*\..*"

# why do some of these need quotations to work, others don't... what??????!!!!!


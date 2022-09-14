#!/bin/bash

# words ending in ing
grep .*ing ./grep_wordlist.txt | sort 

# number of words ening ing
grep -c .*ing ./grep_wordlist.txt | sort

# words starting in be
grep ^be.* ./grep_wordlist.txt | sort

# exact word test (I don't know why this isn't working
grep -w "test" ./grep_wordlist.txt | sort

# word starts with m ends with t
grep m.*t ./grep_wordlist.txt | sort

# MAC addresses
grep ..:..:..:..:..:.. ./grep_wordlist.txt | sort

# telephone addresses isn't working
grep \(...\)-...-.... ./grep_wordlist.txt | sort

# email addresses 
grep .*\@.*\.com ./grep_wordlist.txt | sort

# social security numbers

# IP address


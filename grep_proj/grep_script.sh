#!/bin/bash

# words ending in ing
grep "/*ing" ./grep_wordlist.txt | sort 

# number of words ening ing
grep -c "/*ing" ./grep_wordlist.txt | sort

# words starting in be
grep "be/*" ./grep_wordlist.txt | sort

# exact word test
grep -w "test" ./grep_wordlist.txt | sort




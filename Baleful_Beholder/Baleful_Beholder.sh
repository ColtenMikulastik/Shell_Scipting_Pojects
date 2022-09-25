#!/bin/bash

#check if path is given
if [ -z "$1" ]
then
	# if path arg is empty, then default to Documents
	echo "no file chosen"
	watcher="/home/${USER}/Documents/"
else
	# if path is specified, then set watch variable to it
	echo "file is specified"
	watcher=$1
fi

# let user know what file I am checking
echo "checking file $watcher"

# remove and replace log file, so that entries are not persistent
rm access_log.txt

# re-create access_log file
# cut removes chaff from output, this will help with logfile storage size 
# removes characters before 26 and after 38
ls -al ${watcher} | cut -c26-38 > access_log.txt

# specify beginning of check
echo "begining file check"

# loop forever: Ctrl-C to stop
while :
do
	# notify user that file is being watched
	echo "watching file: $watcher : ..."

	# print file information with ls store in local var and cut for important date info
	curr_iter=$(ls -al ${watcher} | cut -c26-38)
	echo $curr_iter

	# store output of tail
	past_iter=$(tail -1 access_log.txt)

	# then check if time difference
	# This will not check for change in month or day yet
	# to do this I'm gonna delimiate on ' ' and store the last variable of created array
	past_iter_time= echo $past_iter | cut -d' ' -f 3
	curr_iter_time= echo $curr_iter | cut -d' ' -f 3
	
	# check equality of both times
	if [ $past_iter_time -eq $curr_iter_time ]
	then
		# let user know that no changes have occured
		echo "No change to report"
	else
		# if change, then notify user
		echo "file has changed as of: $(time)"
	fi
	
	# write local var to log file 
	echo $curr_iter >> access_log.txt

	# wait one second
	sleep 1

done
# if I add a break statement, I need to make sure to zip the log file because it's probably going to be huge


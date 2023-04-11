#!/bin/bash

# this automatically mounts the samba filesystem

ShareName="sambashare"
IPADD="192.168.1.10"
# IPADD="10.8.0.1"
# IPADD= $0
MountPoint="/mnt/samba"
User="luca"

echo "please run as admin!"

if [ $EUID == 0 ]
then	
	echo "Mounting: $ShareName@$IPADD: at $MountPoint"

	# actually mount the samba share
	sudo mount -t cifs -o username=$User //$IPADD/$ShareName $MountPoint
	
	# this could use that one expect thing to automate giving password

else
	echo "could not mount, must be higher priv."
fi





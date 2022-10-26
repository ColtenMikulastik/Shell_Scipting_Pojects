#!/bin/bash

# Colten Mikulastik
# this is a scp handler script that will be turned into a service

# 1. check for ssh
# 2. ask for input stuff
# 3. create user
# 4. make connection between devices
# 5. utilize connection between devices
# 6. free up resources, remove user

#code to check for service
service_exists_ssh() {
	if [[ systemctl list-units | grep sshd.service == "sshd.service loaded	loaded active running	OpenSSH Daemon"]]
	then
        return 0
    else
        return 1
    fi
}

# check for ssh
ssh_running=service_exists_ssh

if [[ $ssh_running ]]
then 
	echo "1. ssh is running..."
else
	echo "ssh is not running currently, run service and try again"
fi

#!/bin/bash

ls -al ./access_log.txt
var=$(ls -al ./access_log.txt | cut -c28-39)
date --date "$var" +%s

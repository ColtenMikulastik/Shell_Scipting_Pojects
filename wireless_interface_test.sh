#!/bin/bash


while [ True ]
do
	# print the wlo's signal strenght
	iwconfig | grep "Signal level"
	sleep 3

done


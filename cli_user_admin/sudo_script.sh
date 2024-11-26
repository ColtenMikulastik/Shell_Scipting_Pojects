
#!/bin/bash

# make sure user is root
if [ $EUID -ne 0 ]
then
	echo "must be admin to run this script!!!"
else
	echo "you are admin running python script."
	./venv/bin/python3 ./main.py	
fi



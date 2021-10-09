#!/bin/bash

#Generate verthash.dat if it doesn't already exist.
DAT=/config/verthash.dat
if [ -f "$DAT" ]; then
    echo "$DAT exists."
else 
    echo "$DAT does not exist, generating one now."
	/app/VerthashMiner  --gen-verthash-data /config/verthash.dat 
fi

#Variables
#Create base command to run.
CMD="/app/VerthashMiner --verthash-data /config/verthash.dat --all-cl-devices --all-cu-devices "

#Check if ALGO var is set.
if [ -z ${ALGO+x} ]
then
	echo "ALGO is unset, please go back and set it."
else
	echo "ALGO is set to '$ALGO'"
	CMD+="--algo $ALGO "
fi

#Check if URL var is set.
if [ -z ${URL+x} ]
then
	echo "URL is unset, please go back and set it."
else
	echo "URL is set to '$URL'"
	CMD+="--url $URL "
fi

#Check if USER var is set.
if [ -z ${USER+x} ]
then
	echo "USER is unset, please go back and set it."
else
	echo "USER is set to '$USER'"
	CMD+="--user $USER "
fi

#Check if PASS var is set.
if [ -z ${PASS+x} ]
then
	echo "PASS is unset, please go back and set it."
else
	echo "PASS is set to '$PASS'"
	CMD+="--pass $PASS "
fi

#Launch VerthashMiner using aquired variables.
$CMD
exit
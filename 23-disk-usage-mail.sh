#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=10
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')

    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        ##MESSAGE="$FOLDER is more than $DISK_THRESHOLD, Current Usage: $USAGE" --> override previous value
        MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, Current Usage: $USAGE \n"
    fi

done <<< $DISK_USAGE

echo "Message : $MESSAGE"
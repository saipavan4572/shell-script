#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=10

while IFS = read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $6F}')

    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$FOLDER is more than $DISH_THRESHOLD, Current Usage: $USAGE"
    fi

done <<< $DISK_USAGE

#!/bin/bash

## display the top 5 cpu consuming process in linux, send alert if more than threshold

CPU_USAGE=$(ps auxk-c --no-headers | head -6 | awk -F " " '{print $3F}')
PROCESSID=$(ps auxk-c --no-headers | head -6 | awk -F " " '{print $2F}')
CPU_THRESHOLD=10
MESSAGE=""

echo "CPU Usage is: $CPU_USAGE"
echo "ProcessIds: $"
while IFS= read -r line
do
    USAGE=$(echo $line)

    if [ $USAGE -ge $CPU_THRESHOLD ]
    then        
        MESSAGE+="$PROCESSID is more than $CPU_THRESHOLD, Current Usage is: $USAGE \n"
    fi

done <<< $CPU_USAGE

echo -e "Message : $MESSAGE"

# echo "body" | mail -s "subject" to-email-address

echo "$MESSAGE" | mail -s "CPU Usage Alert!!" pavan.pathakota@gmail.com
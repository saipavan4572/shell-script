#!/bin/bash

## display the top 5 cpu consuming process in linux, send alert if more than threshold

CPU_USAGE=$(ps auxk-c --no-headers | head -6)
CPU_THRESHOLD=0.0
MESSAGE=""

echo -e "CPU Usage is: \n$CPU_USAGE"

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $3F}')
    #echo "usage is: $USAGE"
    PID=$(echo $line | awk -F " " '{print $2F}')
    #echo -e "PID is: $PID \n"

    #if [$USAGE -ge $CPU_THRESHOLD ]
    if (( $(bc -l<<<"$USAGE>=$CPU_THRESHOLD") )) 
    then        
        MESSAGE+="PID:$PID cpu usage is more than $CPU_THRESHOLD, Current Usage is: $USAGE \n"
    fi

done <<< $CPU_USAGE

echo -e "Message : $MESSAGE"

# echo "body" | mail -s "subject" to-email-address


echo "$MESSAGE" | mail -s "CentOS-Server CPU Usage Alert!!" pavan.pathakota@gmail.com
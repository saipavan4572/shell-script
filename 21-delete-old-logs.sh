#!/bin/bash

SOURCE_DIR=/tmp/app-logs

R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"

if [ -d $SOURCE_DIR ]
then 
    echo -e "$G Soruce Directory exists $N"
else
    echo -e "$R Please make sure $SOURCE_DIR exists!!! $N"
    exit 1
fi

<<com
case-1 if the directory exists
[ ec2-user@ip-172-31-25-61 ~/shell-script ]$ sh 21-delete-old-logs.sh
 Soruce Directory exists

 case-2 if the directory does't exists
[ ec2-user@ip-172-31-25-61 ~/shell-script ]$ sh 21-delete-old-logs.sh
 Please make sure /tmp/app-logsabc exists!!!



com


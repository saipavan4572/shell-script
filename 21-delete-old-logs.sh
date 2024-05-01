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

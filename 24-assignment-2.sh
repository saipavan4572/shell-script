#!/bin/bash

##Develop a backup script that takes a source direcotory and a destination direcotory as input and creates a compressed archive (.tar.gz) of the source direcotory in the destination folder with a timestamp.

TIMESTAMP=$(date +%F-%H-%M-%S)

echo "Timestamp: $TIMESTAMP"

SORUCE_DIR=$1
DESTINATION_DIR=$2

echo "Source directory: $SORUCE_DIR"
echo "Destination directory: $DESTINATION_DIR"

#check if source and destination arguments passwed or not

if [ $# -ne 2 ]
then
        echo "Enter the source and destination directory paths"
        exit 1
fi

#checking if the source directory exists

if [ ! -d $SORUCE_DIR ]
then
        echo "Directory $SORUCE_DIR not found"
elif [ ! -d $2 ]
then
        echo "directory $2 not found"
fi

ARCHIVE="${2}/backup-${TIMESTAMP}.tar.gz"

tar -cvzf $ARCHIVE $SORUCE_DIR

echo "Backup $ARCHIVE created successfully."
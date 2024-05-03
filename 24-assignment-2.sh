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

echo "Archived file created at destination: $ARCHIVE"

tar -cvzf $ARCHIVE $SORUCE_DIR

## c - This flag signals the "creation" of the .tar file. It should always come first.
## v - This indicates that the process is "verbose". This will display a readout of all the files that  get added to the .tar file as it is being created. This is an optional flag.
## z - This flag will compress the new .tar file using gzip. Make sure to include the .gz extension at the end of the file name.
## f - This flag signifies that the next part will be the new .tar file's file name. It should always be the last flag.

echo "Backup $ARCHIVE created successfully."

<<com

[ ec2-user@ip-172-31-28-41 ~/shell-script ]$ sh 24-assignment-2.sh src-dir dest-dir
Timestamp: 2024-05-03-16-56-02
Source directory: src-dir
Destination directory: dest-dir
Archived file created at destination: dest-dir/backup-2024-05-03-16-56-02.tar.gz
src-dir/
src-dir/words.txt
src-dir/test1.log
src-dir/test2.log
src-dir/test3.log
src-dir/words-2.txt
Backup dest-dir/backup-2024-05-03-16-56-02.tar.gz created successfully.

com
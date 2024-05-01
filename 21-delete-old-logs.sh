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

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +10)

echo "Files to delete : $FILES"

while IFS= read -r line
do
    echo "Deleting files: $line"
    rm -rf $line
done <<<$FILES


<<com
case-1 if the directory exists
[ ec2-user@ip-172-31-25-61 ~/shell-script ]$ sh 21-delete-old-logs.sh
 Soruce Directory exists

 case-2 if the directory does't exists
[ ec2-user@ip-172-31-25-61 ~/shell-script ]$ sh 21-delete-old-logs.sh
 Please make sure /tmp/app-logsabc exists!!!

find command to fetch/get only the specific extension files(ex: log files)
[ ec2-user@ip-172-31-25-61 /tmp/app-logs ]$ find . -name "*.log"
./common-test.log
./test3.log
./test2.log
./test1.log

to fetch the files with .log extension which are older than from today is:
find . -type f -name "*.log" -mtime +10
---->> -mtime - modified time
[ ec2-user@ip-172-31-25-61 /tmp/app-logs ]$ find . -name "*.log" -mtime +10
./mysql-test.log
./common-test.log
./test2.log
./test1.log

---> ./mysql-test.log is a directory

to fetch the .log files which are older than from today is:
[ ec2-user@ip-172-31-25-61 /tmp/app-logs ]$ find . -name "*.log" -type f -mtime +10
./common-test.log
./test2.log
./test1.log

IFS - Internal Field Separator

com

#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE(){
    if [ $1 -ne 0 ]         # $1 - we have exit status whenever we call the function passing $? as input
    then
        echo "$2.....FAILED"
        exit 1              # we use exit command only when there is a failure
    else
        echo "$2.....SUCCESS" 
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysql -y &>> $LOGFILE
VALIDATE $? "Installing MySql"

dnf install git -y &>> $LOGFILE
VALIDATE $? "Installing Git"


echo "End of the script"

<<com

[ root@ip-172-31-16-7 ~/shell-script ]# sh 13-logfile.sh
You are super user.
Installing MySql.....SUCCESS
Installing Git.....SUCCESS
End of the script

34.229.12.92 | 172.31.16.7 | t2.micro | https://github.com/saipavan4572/shell-script.git
[ root@ip-172-31-16-7 ~/shell-script ]# cd /tmp

34.229.12.92 | 172.31.16.7 | t2.micro | null
[ root@ip-172-31-16-7 /tmp ]# ls -l
total 4
-rw-r--r-- 1 root root 356 Apr 27 17:59 13-logfile-2024-04-27-17-59-29.log
drwx------ 3 root root  60 Apr 27 17:04 systemd-private-858a19dbe9164731a27896a31a0d3c7e-chronyd.service-lZazuZ
drwx------ 3 root root  60 Apr 27 17:04 systemd-private-858a19dbe9164731a27896a31a0d3c7e-dbus-broker.service-wSCSKa
drwx------ 3 root root  60 Apr 27 17:04 systemd-private-858a19dbe9164731a27896a31a0d3c7e-systemd-logind.service-PZSuqO

34.229.12.92 | 172.31.16.7 | t2.micro | null
[ root@ip-172-31-16-7 /tmp ]# cat 13-logfile-2024-04-27-17-59-29.log
Last metadata expiration check: 0:48:49 ago on Sat Apr 27 17:10:41 2024.
Package mysql-8.0.36-1.el9_3.x86_64 is already installed.
Dependencies resolved.
Nothing to do.
Complete!
Last metadata expiration check: 0:48:50 ago on Sat Apr 27 17:10:41 2024.
Package git-2.39.3-1.el9_2.x86_64 is already installed.
Dependencies resolved.
Nothing to do.
Complete!


com

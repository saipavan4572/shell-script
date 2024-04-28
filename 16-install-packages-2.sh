#!/bin/bash

USERID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]        
    then
        echo -e "$2.....$R FAILED $N"
        exit 1             
    else
        echo -e "$2.....$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

##echo "All packages: $@"

for i in $@
do
    echo "Package to insatll is:: $i"
    dnf list installed $i>> $LOGFILE
    if [ $? -eq 0 ]
    then 
        echo -e "$i is already installed... $Y SKIPPING $N"
    else
        dnf install $i -y &>>$LOGFILE
        VALIDATE $? "Installing of $i"
    fi
done

<<com

[ root@ip-172-31-16-7 ~/shell-script ]# bash 16-install-packages-2.sh mysql git gcc fail2ban
You are super user.
Package to insatll is:: mysql
Error: No matching Packages to list
Installing of mysql..... SUCCESS
Package to insatll is:: git
git is already installed...  SKIPPING
Package to insatll is:: gcc
Error: No matching Packages to list
Installing of gcc..... SUCCESS
Package to insatll is:: fail2ban
Error: No matching Packages to list
Installing of fail2ban..... SUCCESS



com
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

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "Installing mysql server"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enabling MYSQL server"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "starting MYSQL server"

##OPTION-1
##mysql_secure_installation --set-root-pass ExpenseApp@1
##VALIDATE $? "setting up root password for MYSQL server"

#below code is useful to achive the idempotent nature
##OPTION-2 : hardcode the password in the script
mysql -h db.pspkdevops.online -uroot -pExpenseApp@1 -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
    VALIDATE $? "Setting up MYSQL root password"
else
    echo -e "MYSQL root password is already setup...$Y SKIPPING $N"
fi

##OPTION-3
## instead of hardcode the password we can pass it as argument while running the script
echo "Please enter DB password: "
read -s mysql_root_password

mysql -h db.pspkdevops.online -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
    VALIDATE $? "Setting up MYSQL root password"
else
    echo -e "MYSQL root password is already setup...$Y SKIPPING $N"
fi
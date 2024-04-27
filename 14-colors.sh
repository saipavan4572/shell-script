#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

echo "Starting of the Colors script $TIMESTAMP"

R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]         # $1 - we have exit status whenever we call the function passing $? as input
    then
        echo -e "$2.....$R FAILED $N"
        exit 1              # we use exit command only when there is a failure
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

dnf install mysql -y &>> $LOGFILE
VALIDATE $? "Installing MySql"

dnf install git -y &>> $LOGFILE
VALIDATE $? "Installing Git"

dnf install dockerr -y &>> $LOGFILE
VALIDATE $? "Installing docker - wrong command"

echo -e "$B End of the script : $N $TIMESTAMP"







<<com

[ root@ip-172-31-16-7 ~/shell-script ]# echo -e "\e[31mhello world" 
hello world     -----> RED

[ root@ip-172-31-16-7 ~/shell-script ]# echo -e "\e[32mhello world"
hello world     -----> GREEN

[ root@ip-172-31-16-7 ~/shell-script ]# echo -e "\e[33mhello world"
hello world     -----> YELLO

[ root@ip-172-31-16-7 ~/shell-script ]# echo -e "\e[34mhello world"
hello world     -----> BLUE

[ root@ip-172-31-16-7 ~/shell-script ]# echo -e "\e[35mhello world"
hello world     -----> PURPLE

[ root@ip-172-31-16-7 ~/shell-script ]# echo -e "\e[36mhello world"
hello world     -----> 

[ root@ip-172-31-16-7 ~/shell-script ]# echo -e "\e[37mhello world"
hello world     -----> WHITE

[ root@ip-172-31-16-7 ~/shell-script ]# echo -e "\e[31m hello \e[32m world"
 hello  world   -----> RED & GREEN

 [ root@ip-172-31-16-7 ~/shell-script ]# echo -e "\e[34m hello \e[0m world"
 hello  world   -----> BLUE & WHILE

==========================================================================

[ root@ip-172-31-16-7 ~/shell-script ]# sh 14-colors.sh
Starting of the Colors script 2024-04-27-18-39-32
You are super user.
Installing MySql..... SUCCESS
Installing Git..... SUCCESS
Installing docker - wrong command..... FAILED

Now we can go and check in the log file for the failed installtion script/command details.

com


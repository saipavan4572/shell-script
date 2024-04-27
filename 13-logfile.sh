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
calling a function:

FUNCTIONNAME input-1 input-2 ...
ex:
VALIDATE $? "Installing MySql"

here we are calling VALIDATE function with two inputs, 
$? - for the exit status of previously executed script/command
"Installing MySql" - string/text message for what we are doing
com

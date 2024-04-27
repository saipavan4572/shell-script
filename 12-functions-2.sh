#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2.....FAILED"
        exit 1
    else
        echo "$2.....SUCCESS"
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysql -y
VALIDATE $? "Installing MySql"

dnf install git -y
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

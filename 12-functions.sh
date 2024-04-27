#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "Exit status: $1"
    echo "Action: $2"
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

#!/bin/bash

set -e

failure(){
    echo "Failed at :$1  :: $2"
}
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u) #ERR ---> Error signal

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysqlsldkf -y
dnf install git -y

echo "End of the script."

<<com

set -e ---> shell script checks every instruction/command manually and stop/exit if any error occurs
This method is uesful in while working on the Crontab cron jobs.

But there is no much performance diffrence between this "set -e" command and any manully created method used for validation(ex: VALIDATE)

[ ec2-user@ip-172-31-25-61 ~/shell-script ]$ sudo sh 20-set.sh
You are super user.
Last metadata expiration check: 0:00:38 ago on Wed May  1 12:15:35 2024.
No match for argument: mysqlsldkf
Error: Unable to find a match: mysqlsldkf

com

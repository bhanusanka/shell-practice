#!/bin/Bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "error:please run with root access"
    exit 1
else
    echo "running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then    
    echo "mysql is not installed...gng to install"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then    
        echo "mysql is installed"
    else
        echo "mysql installation is failure"
        exit 1
    fi 
else
    echo "mysql is already installed ntg to do"
fi

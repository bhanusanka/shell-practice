#!/bin/Bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "error:please run with root access"
    exit 1
else
    echo "running with root access"
fi
